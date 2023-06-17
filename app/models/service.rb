# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :store
  belongs_to :branch
  has_many :service_variants

  class << self
    def fake_records
      10.times do
        Service.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          store_id: Store.all.sample.id,
          branch_id: Branch.all.sample.id
        )
      end
    end
  end
end
