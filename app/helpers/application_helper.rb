# frozen_string_literal: true

module ApplicationHelper
  def is_control_room_component
    controller_name == 'operations_room' || action_name == 'new' || action_name == 'edit' || action_name == 'destroy'
  end

  def is_devise_component
    %w[sessions registrations confirmations unlocks passwords].include? controller_name
  end
end
