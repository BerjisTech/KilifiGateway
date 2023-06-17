class GovernmentFacilitiesController < ApplicationController
  before_action :set_government_facility, only: %i[ show edit update destroy ]

  # GET /government_facilities or /government_facilities.json
  def index
    @government_facilities = GovernmentFacility.all
  end

  # GET /government_facilities/1 or /government_facilities/1.json
  def show
  end

  # GET /government_facilities/new
  def new
    @government_facility = GovernmentFacility.new
  end

  # GET /government_facilities/1/edit
  def edit
  end

  # POST /government_facilities or /government_facilities.json
  def create
    @government_facility = GovernmentFacility.new(government_facility_params)

    respond_to do |format|
      if @government_facility.save
        format.html { redirect_to government_facility_url(@government_facility), notice: "Government facility was successfully created." }
        format.json { render :show, status: :created, location: @government_facility }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @government_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /government_facilities/1 or /government_facilities/1.json
  def update
    respond_to do |format|
      if @government_facility.update(government_facility_params)
        format.html { redirect_to government_facility_url(@government_facility), notice: "Government facility was successfully updated." }
        format.json { render :show, status: :ok, location: @government_facility }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @government_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /government_facilities/1 or /government_facilities/1.json
  def destroy
    @government_facility.destroy

    respond_to do |format|
      format.html { redirect_to government_facilities_url, notice: "Government facility was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_government_facility
      @government_facility = GovernmentFacility.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def government_facility_params
      params.require(:government_facility).permit(:name, :type, :location)
    end
end
