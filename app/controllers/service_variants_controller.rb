class ServiceVariantsController < ApplicationController
  before_action :set_service_variant, only: %i[ show edit update destroy ]

  # GET /service_variants or /service_variants.json
  def index
    @service_variants = ServiceVariant.all
  end

  # GET /service_variants/1 or /service_variants/1.json
  def show
  end

  # GET /service_variants/new
  def new
    @service_variant = ServiceVariant.new
  end

  # GET /service_variants/1/edit
  def edit
  end

  # POST /service_variants or /service_variants.json
  def create
    @service_variant = ServiceVariant.new(service_variant_params)

    respond_to do |format|
      if @service_variant.save
        format.html { redirect_to service_variant_url(@service_variant), notice: "Service variant was successfully created." }
        format.json { render :show, status: :created, location: @service_variant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_variants/1 or /service_variants/1.json
  def update
    respond_to do |format|
      if @service_variant.update(service_variant_params)
        format.html { redirect_to service_variant_url(@service_variant), notice: "Service variant was successfully updated." }
        format.json { render :show, status: :ok, location: @service_variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_variants/1 or /service_variants/1.json
  def destroy
    @service_variant.destroy

    respond_to do |format|
      format.html { redirect_to service_variants_url, notice: "Service variant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_variant
      @service_variant = ServiceVariant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_variant_params
      params.require(:service_variant).permit(:service_id, :name, :description)
    end
end
