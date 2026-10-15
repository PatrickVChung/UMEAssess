class CalendarLinksController < ApplicationController
  before_action :set_calendar_link, only: %i[ show edit update destroy ]

  # GET /calendar_links or /calendar_links.json
  def index
    @calendar_links = CalendarLink.all
  end

  # GET /calendar_links/1 or /calendar_links/1.json
  def show
  end

  # GET /calendar_links/new
  def new
    @calendar_link = CalendarLink.new
  end

  # GET /calendar_links/1/edit
  def edit
  end

  # POST /calendar_links or /calendar_links.json
  def create
    @calendar_link = CalendarLink.new(calendar_link_params)

    respond_to do |format|
      if @calendar_link.save
        format.html { redirect_to @calendar_link, notice: "Calendar link was successfully created." }
        format.json { render :show, status: :created, location: @calendar_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calendar_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendar_links/1 or /calendar_links/1.json
  def update
    respond_to do |format|
      if @calendar_link.update(calendar_link_params)
        format.html { redirect_to @calendar_link, notice: "Calendar link was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @calendar_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calendar_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendar_links/1 or /calendar_links/1.json
  def destroy
    @calendar_link.destroy!

    respond_to do |format|
      format.html { redirect_to calendar_links_path, notice: "Calendar link was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar_link
      @calendar_link = CalendarLink.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def calendar_link_params
      params.expect(calendar_link: [ :advisor_id, :title, :url, :description ])
    end
end
