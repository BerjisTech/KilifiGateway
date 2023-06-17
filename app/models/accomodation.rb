# frozen_string_literal: true

class Accomodation < ApplicationRecord
  belongs_to :owner

  class << self
    def fake_records
      10.times do
        Accomodation.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          owner_id: Owner.all.sample.id
        )
      end
    end
  end
end
