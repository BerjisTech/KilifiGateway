# frozen_string_literal: true

class OperationsRoomController < ApplicationController
  before_action :authenticate_user!

  def command_center; end

  def property; end

  def stores; end

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
