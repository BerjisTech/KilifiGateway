# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :user

  class << self
    def fake_records
      10.times do
        Transaction.create(
          amount: Faker::Number.decimal.round(2),
          wallet_id: Wallet.all.sample.id
        )
      end
    end
  end
end
