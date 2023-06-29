# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_static_arrays
  before_action :create_default_guest_user
  before_action :setup_command_center_links

  ACTION_ICONS = {
    'command_center' => 'dashboard',
    'stores' => 'store',
    'branches' => 'local_convenience_store',
    'products' => 'inventory',
    'services' => 'inventory_2',
    'on_demand_services' => 'cleaning_services',
    'treasury' => 'account_balance',
    'support' => 'live_help',
    'staffs' => 'groups',
    'property' => 'real_estate_agent'
  }.freeze

  ACTION_FAMILY = {
    'branches' => 'stores',
    'products' => 'branches',
    'services' => 'branches',
    'staffs' => 'stores'
  }.freeze

  SKIP_COMMAND_CENTER_ACTIONS = %w[create_default_guest_user set_static_arrays method_arrays
                                   has_parent has_children setup_command_center_links
                                   owners staffs products service on_demand_services ignore_suggester].freeze

  SKIP_ACTIONS_WITHOUT_OWNER = %w[owners stores branches staffs products services
                                  property].freeze
  SKIP_ACTIONS_WITHOUT_PROPERTY = %w[property].freeze
  SKIP_ACTIONS_WITHOUT_SERVICE_PROVIDER = ['on_demand_services'].freeze

  def set_static_arrays
    @search_categories = ['Products', 'Services', 'On Demand Service', 'Accomodation', 'Government Services'].freeze
  end

  def create_default_guest_user
    @guest_user = User.find_by(email: 'guest@kilifigateway.com')
    return unless @guest_user.nil?

    @guest_user = User.create!(name: 'Guest', email: 'guest@kilifigateway.com', password: 'guest1234',
                               password_confirmation: 'guest1234')
  end

  def setup_command_center_links
    @action_links = []
    user = current_user.nil? ? @guest_user : current_user
    owner = Owner.where(user_id: user.id).first
    staff = Staff.where(user_id: user.id).first
    has_property = owner.present? && Accomodation.find_by(owner_id: owner.id).present?
    service_provider = ServiceProvider.where(user_id: user.id).first

    puts has_property

    OperationsRoomController.action_methods.sort.map do |action|
      next if SKIP_COMMAND_CENTER_ACTIONS.include?(action)
      next if current_user.nil? || (owner.blank? && staff.blank? && SKIP_ACTIONS_WITHOUT_OWNER.include?(action))
      next if current_user.nil? || (owner.blank? && SKIP_ACTIONS_WITHOUT_SERVICE_PROVIDER.include?(action))
      next if current_user.nil? || (!has_property && SKIP_ACTIONS_WITHOUT_PROPERTY.include?(action))

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

    @owner = Owner.where(user_id: user.id).first
    @service_provider = ServiceProvider.where(user_id: user.id).first
    @staff = Staff.where(user_id: user.id).first
  end

  def has_parent(action)
    %w[
      branches
      products
      services
      staffs
    ].include? action
  end

  def has_children(action)
    %w[stores branches].include? action
  end
end
