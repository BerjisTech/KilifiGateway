# frozen_string_literal: true

class Branch < ApplicationRecord
  belongs_to :store
  has_many :staffs
  has_many :products
  has_many :services
  has_many :store_contacts

  class << self
    def fake_records
      10.times do
        Branch.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          store_id: Store.all.sample.id
        )
      end
    end
  end
end
