class OperationsRoomController < ApplicationController
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
      # render json: @action_links
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
    OperationsRoomController.action_methods.sort.map do |action|
      next unless !['create_default_guest_user','set_static_arrays','method_arrays','has_parent','has_children', 'setup_links'].include? action
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
    @action_icons = {}
    @action_children = {}
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
