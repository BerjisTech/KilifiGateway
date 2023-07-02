# frozen_string_literal: true

class OperationsRoomController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_command_center, only: %i[command_center property stores branches staffs products services on_demand_services treasury support]

  def setup_command_center
  end

  def command_center; end

  def property; end

  def stores
    page = params[:page] || 1
    @stores = @owner.stores.page(page).per(10)
  end

  def branches; end

  def staffs; end

  def products; end

  def services; end

  def on_demand_services; end

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
