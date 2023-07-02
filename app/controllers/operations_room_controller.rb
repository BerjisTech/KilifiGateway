# frozen_string_literal: true

class OperationsRoomController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_command_center,
                only: %i[command_center property stores branches staffs products services on_demand_services treasury
                         support]

  def setup_command_center
    redirect_to new_on_demand_service_path if @service_provider.nil? && action_name == 'on_demand_services'
    redirect_to new_store_path if @owner.nil? && %w[stores branches staffs products services].include?(action_name)
    redirect_to new_accomodation_path if @owner.nil? && %w[property].include?(action_name)
  end

  def command_center; end

  def property
    page = params[:page] || 1
    @properties = @owner.accomodations.page(page).per(10)
  end

  def stores
    page = params[:page] || 1
    @stores = @owner.stores.page(page).per(10)
  end

  def branches
    page = params[:page] || 1
    @branches = @owner.branches.page(page).per(10)
  end

  def staffs
    page = params[:page] || 1
    @staffs = @owner.staffs.page(page).per(10)
  end

  def products
    page = params[:page] || 1
    @products = @owner.products.page(page).per(10)
  end

  def services
    page = params[:page] || 1
    @services = @owner.services.page(page).per(10)
  end

  def on_demand_services
    page = params[:page] || 1
    @on_demand_services = @service_provider.on_demand_services.page(page).per(10)
  end

  def treasury; end

  def support; end

  def ignore_suggester
    current_user.update(suggest_service_provider_guide: false) if params[:suggester] == 'service_provider'
    current_user.update(suggest_owner_guide: false) if params[:suggester] == 'owner'
    current_user.update(suggest_property_guide: false) if params[:suggester] == 'property'
    if params[:suggester] == 'both'
      current_user.update(suggest_owner_guide: false,
                          suggest_service_provider_guide: false)
    end
    if params[:suggester] == 'admin_reset'
      current_user.update(suggest_owner_guide: true,
                          suggest_service_provider_guide: true)
    end
    redirect_to operations_center_path
  end
end
