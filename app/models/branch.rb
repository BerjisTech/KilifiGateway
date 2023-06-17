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
          store_id: Store.all.sample.id,
          location: Faker::Address.full_address
        )
      end
    end
  end
end
