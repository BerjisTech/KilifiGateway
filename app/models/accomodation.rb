# frozen_string_literal: true

class Accomodation < ApplicationRecord
  belongs_to :owner

  class << self
    def fake_records
      10.times do
        Accomodation.create(
          owner: Owner.all.sample,
          description: Faker::Lorem.paragraph,
          bathrooms: rand(1..5),
          bedrooms: rand(1..5),
          balcony: rand(0..1),
          location: Faker::Address.full_address
        )
      end
    end
  end
end