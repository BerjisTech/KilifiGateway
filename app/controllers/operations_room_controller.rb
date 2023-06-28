class OperationsRoomController < ApplicationController
  before_action :authenticate_user!

  def command_center
    if @owner.present? || @service_provider.present? || @staff.present?
      render '_dashboard'
    else
      render '_guide_main'
    end
  end

  def property
  end

  def stores
  end

  def branches
  end

  def staffs
  end

  def products
  end

  def services
  end

  def on_demand_services
    
  end

  def treasury
  end

  def support
  end
end
