class AcceptedCurrenciesController < ApplicationController
  before_action :set_accepted_currency, only: %i[ show edit update destroy ]

  # GET /accepted_currencies or /accepted_currencies.json
  def index
    @accepted_currencies = AcceptedCurrency.all
  end

  # GET /accepted_currencies/1 or /accepted_currencies/1.json
  def show
  end

  # GET /accepted_currencies/new
  def new
    @accepted_currency = AcceptedCurrency.new
  end

  # GET /accepted_currencies/1/edit
  def edit
  end

  # POST /accepted_currencies or /accepted_currencies.json
  def create
    @accepted_currency = AcceptedCurrency.new(accepted_currency_params)

    respond_to do |format|
      if @accepted_currency.save
        format.html { redirect_to accepted_currency_url(@accepted_currency), notice: "Accepted currency was successfully created." }
        format.json { render :show, status: :created, location: @accepted_currency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @accepted_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accepted_currencies/1 or /accepted_currencies/1.json
  def update
    respond_to do |format|
      if @accepted_currency.update(accepted_currency_params)
        format.html { redirect_to accepted_currency_url(@accepted_currency), notice: "Accepted currency was successfully updated." }
        format.json { render :show, status: :ok, location: @accepted_currency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @accepted_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accepted_currencies/1 or /accepted_currencies/1.json
  def destroy
    @accepted_currency.destroy

    respond_to do |format|
      format.html { redirect_to accepted_currencies_url, notice: "Accepted currency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accepted_currency
      @accepted_currency = AcceptedCurrency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def accepted_currency_params
      params.require(:accepted_currency).permit(:code, :code_three, :country, :name, :value_against_dollar, :conversion_rate)
    end
end
