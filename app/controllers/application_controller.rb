# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :set_static_arrays
    before_action :create_default_guest_user

    def set_static_arrays
      @search_categories = ['Products', 'Services', 'On Demand Service', 'Accomodation', 'Government Services'].freeze
    end

    def create_default_guest_user
      @guest_user = User.find_by(email: 'guest@kilifigateway.com')
      @guest_user = User.create!(name: 'Guest', email: 'guest@kilifigateway.com', password: 'guest1234', password_confirmation: 'guest1234' ) if @guest_user.nil?
    end
  end