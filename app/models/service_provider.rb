# frozen_string_literal: true

class ServiceProvider < ApplicationRecord
  belongs_to :user
  has_many :on_demand_services
end
