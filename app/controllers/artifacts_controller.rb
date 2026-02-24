class ArtifactsController < ApplicationController
  before_action :load_resources

  def index
    if params[:user_id].present?
      @artifacts = Artifact.where(user_id: params[:user_id])
    else
      @artifacts = Artifact.where(user_id: Current.user.id)
    end
    @cohort_students = User.where(permission_group_id: params[:permission_group_id]).order(:full_name)

    respond_to do |format|
      format.html do
        if turbo_frame_request?
          render :index, layout: false
        else
          render :index
        end
      end
    end

  end

  def show

  end

  def new
    @artifact = Artifact.new

  end

  def create
    @cohort_students = User.where(permission_group_id: params[:permission_group_id]).order(:full_name)
    @artifact = Artifact.new(artifact_params)
    if params[:user_id].present?
      @artifact.user_id = params[:user_id]
    else
      @artifact.user_id = Current.user.id
    end
    @artifact.title = Category.find(params[:title]).name
    @artifact.content = SubCategory.find(params[:content]).name

      if @artifact.save
        respond_to do |format|
          format.turbo_stream {
            render turbo_stream: turbo_stream.replace("artifact_form", partial: "artifacts/form", locals: { artifact: Artifact.new })
          }
          format.html { redirect_to @artifact }
        end
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
  end
  # PATCH/PUT /artifacts/1
  def update
    if @artifact.update(artifact_params)
      redirect_to @artifact, notice: 'Artifact was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /artifacts/1
  def destroy
    @artifact = Artifact.find(params[:id])
    @artifact.destroy!
    redirect_to artifacts_url, notice: 'Artifact was successfully destroyed.'
  end

  def delete_document
    @doc = ActiveStorage::Attachment.find(params[:document_id])
    @doc.purge # or @doc.purge_later for background processing

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(helpers.dom_id(@doc)) }
      format.html { redirect_to artifact_path(@artifact), notice: "Document deleted." }
    end

  end

  def move_files
    @artifact = Artifact.find(params[:id])
    move_file_to_user(@artifact)
  end

  def step_2_move_files
    @artifact = Artifact.find(params[:id])
    step2_move_files_to_user(@artifact)
  end

  def process_preceptor_eval
    @artifact = Artifact.find(params[:id])
    @log_results = Artifact.process_upload_data(@artifact, 'PreceptorEval')
  end

  def process_formative_feedback
    @artifact = Artifact.find(params[:id])
    @log_results = Artifact.process_upload_data(@artifact, 'FormativeFeedback')
  end

  def process_informatics_feedback
    @artifact = Artifact.find(params[:id])
    @log_results = Artifact.process_upload_data(@artifact, 'InformaticsFeedback')
  end

  def process_usmle_exam
    @artifact = Artifact.find(params[:id])
    @log_results = Artifact.process_upload_data(@artifact, 'UsmleExam')
  end

  def process_comp_excel
    @artifact = Artifact.find(params[:id])
    Artifact.read_competency_excel(@artifact)
    todayDate = Time.now.strftime("%Y_%m_%d")
    filename = "#{Rails.root}/log/competency_#{todayDate}.log"
    render file: filename
  end

  def process_bls_excel
    @artifact = Artifact.find(params[:id])
    Artifact.read_bls_excel(@artifact)
    todayDate = Time.now.strftime("%Y_%m_%d")
    filename = "#{Rails.root}/log/bls_#{todayDate}.log"
    render file: filename
  end

  def ultimate_method
      @problem_artifact  = Artifact.find(params[:id])
      @moved_files = []
      @problem_artifact.documents.each do |document|
        data_array = []
        data_array.push document.filename
        sid = hf_get_user_document(document)

        student_user = User.find_by(sid: sid)
        if !student_user.nil?
          full_name = student_user.full_name

          data_array.push full_name
          data_array.push sid

          temp_artifact = Artifact.find_or_create_by(user_id: student_user.id, content: @problem_artifact.content, title: @problem_artifact.title) do |a|
            a.content = @problem_artifact.content
            a.title = @problem_artifact.title
            a.documents.attach(ActiveStorage::Blob.find(document.blob_id))
          end
          if !temp_artifact.documents.exists?(blob_id: document.blob_id)
             temp_artifact.documents.attach(ActiveStorage::Blob.find(document.blob_id))
          end
          document.destroy # remove it from the artifact
          @moved_files.push data_array
        else
          data_array.push full_name
          data_array.push sid + " - Not Found in User Table!"
          @moved_files.push data_array
        end

      end
  end
  def bulk_remove
    @bulk_remove_files = []
    if params[:Cohort].present? and params[:BlockCode].present? and params[:FileType].present?
      permission_group = PermissionGroup.where('title like ?', '%Med28%').first
      #users = ["1983", "2043", "1941", "1977"]
      @bulk_remove_files = Artifact.gather_files_to_delete(params[:Cohort], permission_group, params[:BlockCode], params[:FileType])
    end

  end

  def purge_all_documents
    if params[:content].present?
      file_path = Rails.root.join('public', "FoM_#{params[:content]}_#{params[:file_type]}.txt")
      CSV.foreach(file_path, col_sep: "\t", headers: true) do |row|
        artifact_id = row["artifact_id"]
        user_id = row["user_id"]
        title = row["title"]
        content = row["content"]
        file_type = row["file_type"]
        test_str = content + "_" + file_type
        artifact = Artifact.find_by(title: title, content: content, id: artifact_id, user_id: user_id)
        artifact.documents.each do |document|
          if document.filename.to_s.include? test_str
            document.purge
            artifact.destroy
          end
        end
      end
    end
  end
  private

    def artifact_params
      params.require(:artifact).permit(:user_id, :title, :content, documents: [])
    end

    def load_resources
      @categories = Category.all.order(:name)
      @student_groups = PermissionGroup.where ("id >= 19")
      @cohort_students = User.where(permission_group_id: params[:permission_group_id]).order(:full_name)
    end

    # def debug_current_user
    #   Rails.logger.warn "!!! ARTIFACTS DEBUG: Current.user is #{Current.user.inspect} !!!"
    #   Rails.logger.warn "!!! COOKIE PRESENT: #{cookies[:ume_session_id].present?} !!!"
    # end

    def move_file_to_user(artifact)

      artifact.documents.each do |document|
        #artifact_document = document.id #ActiveStorage::Blob.find_signed(params[:id])
        if !document.filename.to_s.include? "image00"  ## check to see if it is an image file from informatics feedback so that we can move to it
          temp_str = document.filename.to_s.split(" ")
          if temp_str.last.include? "Preceptorship"
            full_name = temp_str[0] + " " + temp_str[1]
          else
            temp_str2 = temp_str.first.split("_")
            if temp_str2.count == 1
               last_name = temp_str2.first
               temp_str3 = temp_str.second.split("_")
               last_name = last_name + " " + temp_str3.first
               first_name = temp_str3.second
               full_name = last_name + ", " + first_name
            elsif temp_str2.count >= 2
               full_name = temp_str2.first + ", " + temp_str2.second
            else
               return
             end
           end
          @student_user = User.find_by(full_name: full_name)
        else
          username = document.filename.to_s.split("_").first
          @student_user = User.find_by(username: username)
        end

        if !@student_user.nil?
          temp_artifact = Artifact.find_or_create_by(user_id: @student_user.id, content: artifact.content, title: artifact.title) do |a|
            a.content = artifact.content
            a.title = artifact.title
            a.documents.attach(ActiveStorage::Blob.find(document.blob_id))
          end
          if !temp_artifact.documents.exists?(blob_id: document.blob_id)
             temp_artifact.documents.attach(ActiveStorage::Blob.find(document.blob_id))
          end
          document.destroy # remove it from the artifact
        end
      end
    end

    def step2_move_files_to_user(artifact)
      nbme_match_file = "#{Rails.root}/config/Med26_NBME_Name_Match.txt"
      row_hash = {}
      CSV.foreach(nbme_match_file, col_sep: "\t", :headers => true, encoding: "UTF-8") do |row|
        row_hash.store(row["pdf_file"], row["email"])
      end
      artifact.documents.each do |document|
        email = row_hash[document.filename.to_s]
        student_user = User.find_by(email: email)
        if !student_user.nil?
          temp_artifact = Artifact.find_or_create_by(user_id: student_user.id, content: artifact.content, title: artifact.title) do |a|
            a.content = artifact.content
            a.title = artifact.title
            a.documents.attach(ActiveStorage::Blob.find(document.blob_id))
          end
          if !temp_artifact.documents.exists?(blob_id: document.blob_id)
             temp_artifact.documents.attach(ActiveStorage::Blob.find(document.blob_id))
          end
          document.destroy # remove it from the artifact
        end
      end

    end

end
