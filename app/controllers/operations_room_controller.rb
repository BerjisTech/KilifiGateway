class OperationsRoomController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_links

  ACTION_ICONS = {
    "command_center" => "dashboard",
    "stores" => "store",
    "branches" => "local_convenience_store",
    "products" => "inventory",
    "services" => "inventory_2",
    "on_demand_services" => "cleaning_services",
    "treasury" => "account_balance",
    "support" => "live_help",
    "staffs" => "groups"
  }

  ACTION_FAMILY = {
    'branches' => 'stores',
    'products' => 'branches',
    'services' => 'branches',
    'staffs' => 'stores'
  }

  def command_center
    if @owner.present? || @service_provider.present? || @staff.present?
      render '_dashboard'
    else
      render '_guide_main'
    end
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

  def setup_links
    @action_links = []
    owner = Owner.where(user_id: current_user.id).first
    staff = Staff.where(user_id: current_user.id).first
    service_provider = ServiceProvider.where(user_id: current_user.id).first

    skip_actions = ['create_default_guest_user', 'set_static_arrays', 'method_arrays', 
                    'has_parent', 'has_children', 'setup_links', 
                    'owners', 'staffs', 'products', 'service', 'on_demand_services']

    skip_actions_without_owner = ['owners', 'stores', 'branches', 'staffs', 'products', 'services']
    skip_actions_without_service_provider = ['on_demand_services']

    OperationsRoomController.action_methods.sort.map do |action|
      next if skip_actions.include?(action)
      next if owner.blank? && staff.blank? && skip_actions_without_owner.include?(action)
      next if service_provider.blank? && skip_actions_without_service_provider.include?(action)

      @action_links << OpenStruct.new(
        name: action,
        path: "#{root_url}operations_room/#{action}",
        icon: ACTION_ICONS[action],
        has_children: has_children(action),
        has_parent: has_parent(action),
        parent: ACTION_FAMILY[action],
        debug: "Action: #{action}, Icon: #{ACTION_ICONS[action]}"
      )
    end

    @owner = Owner.where(user_id: current_user.id).first
    @service_provider = ServiceProvider.where(user_id: current_user.id).first
    @staff = Staff.where(user_id: current_user.id).first
  end

  def has_parent(action)
    [
      'branches',
      'products',
      'services',
      'staffs'
    ].include? action
  end

  def has_children(action)
    ['stores','branches'].include? action
  end
end
