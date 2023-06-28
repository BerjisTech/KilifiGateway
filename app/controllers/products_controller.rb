# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:store_id, :branch_id, :name, :description, :product_type, :product_category,
                                    :product_sub_category, :color, :size, :weight, :weight_unit, :dimension, :dimension_unit, :sku, :barcode, :manufacturer, :brand, :model, :origin, :condition, :condition_note, :warranty, :warranty_period, :warranty_policy, :return_policy, :return_period, :price, :discount, :tax, :shipping_fee, :shipping_discount, :shipping_discount_price, :shipping_tax, :shipping_weight, :shipping_weight_unit, :shipping_dimension, :shipping_dimension_unit, :shipping_distance, :shipping_distance_unit, :shipping_duration, :featured, :best_seller, :new_arrival, :on_display, :on_sale, :on_auction, :on_rent, :on_demand, :on_pre_order)
  end
end
