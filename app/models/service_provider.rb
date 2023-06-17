# frozen_string_literal: true

class ServiceProvider < ApplicationRecord
  belongs_to :user
  has_many :on_demand_services

  class << self
    def fake_records
      10.times do
        ServiceProvider.create(
          user_id: User.all.sample.id
        )
      end
    end
  end
end
