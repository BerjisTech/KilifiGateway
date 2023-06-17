# frozen_string_literal: true

class Staff < ApplicationRecord
  belongs_to :user
  belongs_to :branch
  belongs_to :store

  class << self
    def fake_records
      10.times do
        Staff.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          user_id: User.all.sample.id,
          branch_id: Branch.all.sample.id,
          store_id: Store.all.sample.id
        )
      end
    end
  end
end
