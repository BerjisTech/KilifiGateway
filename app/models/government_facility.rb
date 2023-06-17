# frozen_string_literal: true

class GovernmentFacility < ApplicationRecord
  class << self
    def fake_records
      10.times do
        GovernmentFacility.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          owner_id: Owner.all.sample.id
        )
      end
    end
  end
end
