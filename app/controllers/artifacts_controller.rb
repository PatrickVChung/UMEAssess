class ArtifactsController < ApplicationController
  before_action :load_cohorts

  def index
    @student_groups = PermissionGroup.where("id >= ?", 20)
    @artifacts = Artifact.where(user_id: Current.user)
  end

  def show
  end

  def new
    @artifact = Artifact.new
    @student_groups = PermissionGroup.where ("id >= 19")
    @cohort_students = User.where(permission_group_id: params[:permission_group_id]).order(:full_name)
    @categories = Category.all

  end

  def create
    respond_to do |format|
      if @artifact.save
        format.turbo_stream
        format.html { redirect_to artifacts_path, notice: "Uploaded!" }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("artifact_form", partial: "form", locals: { artifact: @artifact }) }
        format.html { render :new }
      end
    end
  end

  def edit
  end

  private

    def load_cohorts
      @student_groups = PermissionGroup.where("id >= ?", 20)
    end

end
