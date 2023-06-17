# frozen_string_literal: true

class Owner < ApplicationRecord
  belongs_to :user
  has_many :accomodations
  has_many :government_facilities
  has_many :on_demand_services
  has_many :stores

  class << self
    def fake_records
      10.times do
        Owner.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          user_id: User.all.sample.id
        )
      end
    end
  end
end
