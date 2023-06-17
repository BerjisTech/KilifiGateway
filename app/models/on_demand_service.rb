# frozen_string_literal: true

class OnDemandService < ApplicationRecord
  belongs_to :serviceProvider

  class << self
    def fake_records
      10.times do
        OnDemandService.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          service_provider_id: ServiceProvider.all.sample
        )
      end
    end
  end
end
