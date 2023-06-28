# frozen_string_literal: true

class StoreContactsController < ApplicationController
  before_action :set_store_contact, only: %i[show edit update destroy]

  # GET /store_contacts or /store_contacts.json
  def index
    @store_contacts = StoreContact.all
  end

  # GET /store_contacts/1 or /store_contacts/1.json
  def show; end

  # GET /store_contacts/new
  def new
    @store_contact = StoreContact.new
  end

  # GET /store_contacts/1/edit
  def edit; end

  # POST /store_contacts or /store_contacts.json
  def create
    @store_contact = StoreContact.new(store_contact_params)

    respond_to do |format|
      if @store_contact.save
        format.html { redirect_to store_contact_url(@store_contact), notice: 'Store contact was successfully created.' }
        format.json { render :show, status: :created, location: @store_contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_contacts/1 or /store_contacts/1.json
  def update
    respond_to do |format|
      if @store_contact.update(store_contact_params)
        format.html { redirect_to store_contact_url(@store_contact), notice: 'Store contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_contacts/1 or /store_contacts/1.json
  def destroy
    @store_contact.destroy

    respond_to do |format|
      format.html { redirect_to store_contacts_url, notice: 'Store contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_store_contact
    @store_contact = StoreContact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def store_contact_params
    params.require(:store_contact).permit(:store_id, :branch_id, :contact_info)
  end
end
