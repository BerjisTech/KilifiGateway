class OnDemandServicesController < ApplicationController
  before_action :set_on_demand_service, only: %i[ show edit update destroy ]

  # GET /on_demand_services or /on_demand_services.json
  def index
    @on_demand_services = OnDemandService.all
  end

  # GET /on_demand_services/1 or /on_demand_services/1.json
  def show
  end

  # GET /on_demand_services/new
  def new
    @on_demand_service = OnDemandService.new
  end

  # GET /on_demand_services/1/edit
  def edit
  end

  # POST /on_demand_services or /on_demand_services.json
  def create
    @on_demand_service = OnDemandService.new(on_demand_service_params)

    respond_to do |format|
      if @on_demand_service.save
        format.html { redirect_to on_demand_service_url(@on_demand_service), notice: "On demand service was successfully created." }
        format.json { render :show, status: :created, location: @on_demand_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @on_demand_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /on_demand_services/1 or /on_demand_services/1.json
  def update
    respond_to do |format|
      if @on_demand_service.update(on_demand_service_params)
        format.html { redirect_to on_demand_service_url(@on_demand_service), notice: "On demand service was successfully updated." }
        format.json { render :show, status: :ok, location: @on_demand_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @on_demand_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /on_demand_services/1 or /on_demand_services/1.json
  def destroy
    @on_demand_service.destroy

    respond_to do |format|
      format.html { redirect_to on_demand_services_url, notice: "On demand service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_on_demand_service
      @on_demand_service = OnDemandService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def on_demand_service_params
      params.require(:on_demand_service).permit(:service_provider_id, :name, :description)
    end
end
