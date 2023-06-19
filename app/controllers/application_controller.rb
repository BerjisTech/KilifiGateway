# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :set_static_arrays
    def set_static_arrays
      @search_categories = ['Products', 'Services', 'On Demand Service', 'Accomodation', 'Government Services'].freeze
    end
  end