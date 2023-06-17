# frozen_string_literal: true

class ServiceVariant < ApplicationRecord
  belongs_to :service

  class << self
    def fake_records
      10.times do
        ServiceVariant.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          service_id: Service.all.sample.id
        )
      end
    end
  end
end
