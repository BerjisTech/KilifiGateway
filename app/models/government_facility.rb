# frozen_string_literal: true

class GovernmentFacility < ApplicationRecord
  class << self
    def fake_records
      10.times do
        GovernmentFacility.create(
          name: Faker::Company.name,
          location: Faker::Address.full_address
        )
      end
    end
  end
end
