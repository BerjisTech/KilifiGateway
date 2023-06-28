# frozen_string_literal: true

class AccomodationsController < ApplicationController
  before_action :set_accomodation, only: %i[show edit update destroy]

  # GET /accomodations or /accomodations.json
  def index
    @accomodations = Accomodation.all
  end

  # GET /accomodations/1 or /accomodations/1.json
  def show; end

  # GET /accomodations/new
  def new
    @accomodation = Accomodation.new
  end

  # GET /accomodations/1/edit
  def edit; end

  # POST /accomodations or /accomodations.json
  def create
    @accomodation = Accomodation.new(accomodation_params)

    respond_to do |format|
      if @accomodation.save
        format.html { redirect_to accomodation_url(@accomodation), notice: 'Accomodation was successfully created.' }
        format.json { render :show, status: :created, location: @accomodation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @accomodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accomodations/1 or /accomodations/1.json
  def update
    respond_to do |format|
      if @accomodation.update(accomodation_params)
        format.html { redirect_to accomodation_url(@accomodation), notice: 'Accomodation was successfully updated.' }
        format.json { render :show, status: :ok, location: @accomodation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @accomodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accomodations/1 or /accomodations/1.json
  def destroy
    @accomodation.destroy

    respond_to do |format|
      format.html { redirect_to accomodations_url, notice: 'Accomodation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_accomodation
    @accomodation = Accomodation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def accomodation_params
    params.require(:accomodation).permit(:owner_id, :description, :bathrooms, :bedrooms, :balcony, :location, :name,
                                         :price, :rating, :latitude, :longitude, :amenities, :currency, :max_guests, :min_stay, :max_stay, :guests_included, :extra_guest_fee, :cleaning_fee, :security_deposit, :service_fee, :host_fee, :cancellation_policy, :cancellation_days, :cancellation_penalty, :cancellation_rate)
  end
end
