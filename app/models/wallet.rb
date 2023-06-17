# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :user
  has_many :transactions

  class << self
    def fake_records
      10.times do
        Wallet.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          user_id: User.all.sample.id
        )
      end
    end
  end
end
