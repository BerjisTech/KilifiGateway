# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :owner
  has_many :branches
  has_many :products
  has_many :services
  has_many :store_contacts
  has_many :staffs

  class << self
    def fake_records
      10.times do
        Store.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          owner_id: Owner.all.sample.id
        )
      end
    end
  end
end
