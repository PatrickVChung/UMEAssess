class EpasController < ApplicationController
  before_action :set_epa, only: [:show, :edit, :update, :destroy]

  # GET /epas
  def index
    @epas = []
    @epa_headers = []

    if params[:uuid].present?
      # Use safe navigation (&.) to gracefully handle invalid/missing UUIDs
      user = User.find_by(uuid: params[:uuid])
      @uuid = user.uuid
      relation = user&.epas&.order(:epa, :submit_date)

      if relation&.any?
        # Grab headers directly from the model class without mapping records
        @epa_headers = Epa.column_names

        # Keep the hash mapping only if your view specifically loops through hash keys/values
        @epas = relation.map(&:attributes)
      end
    end

    respond_to do |format|
      format.html
    end
  end

  # GET /epas/1
  def show
  end

  # GET /epas/new
  def new
    @epa = Epa.new
  end

  # GET /epas/1/edit
  def edit
  end

  # POST /epas
  def create
    @epa = Epa.new(epa_params)
    if @epa.save
      redirect_to @epa, notice: 'Epa was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /epas/1
  def update
    respond_to do |format|
      if @epa.update(epa_params)
        format.html { redirect_to @epa, notice: "WBA was successfully updated." }
        format.json { render :show, status: :ok, location: @epa }
      else
        format.html { render :edit }
        format.json { render json: @epa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epas/1
  def destroy
    @epa = Epa.find(params[:id])
    # Grab the user's uuid before destroying so we can redirect back safely
    uuid = @epa.user.uuid
    @epa.destroy
    respond_to do |format|
      format.html { redirect_to epas_path(uuid: uuid), notice: "WBA was successfully destroyed." }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_epa
      @epa = Epa.find(params[:id])
    end

    def load_epas(user_id)
      @epas = Epa.where(user_id: user_id).order(:epa, :submit_date)
      @epas = @epas.map(&:attributes)
      @epa_headers = @epas.first.keys
    end

    # Only allow a trusted parameter "white list" through.
    def epa_params
      params.require(:epa).permit(:submit_date, :student_assessed, :epa, :clinical_discipline, :clinical_setting, :clinical_assessor, :involvement,
        :assessor_name, :assessor_email, :response_id)
    end
end
