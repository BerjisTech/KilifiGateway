# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :user
  has_many :transactions

  class << self
    def fake_records
      10.times do
        Wallet.create(
          user: User.all.sample,
          currency: %w[USD EUR GBP].sample,
          amount: Faker::Number.decimal,
          conversion_rate: Faker::Number.decimal
        )
      end
    end
  end
end
