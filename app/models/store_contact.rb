# frozen_string_literal: true

class StoreContact < ApplicationRecord
  belongs_to :store
  belongs_to :branch

  class << self
    def fake_records
      10.times do
        StoreContact.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          store_id: Store.all.sample.id,
          branch_id: Branch.all.sample.id
        )
      end
    end
  end
end
