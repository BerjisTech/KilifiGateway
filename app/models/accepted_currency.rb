# frozen_string_literal: true

class AcceptedCurrency < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :symbol, presence: true
  validates :code, presence: true
  validates :country, presence: true

  # Associations
  has_many :wallets

  class << self
    def fake_records
      10.times do
        AcceptedCurrency.create(
          name: Faker::Currency.name,
          symbol: Faker::Currency.symbol,
          code: Faker::Currency.code,
          country: Faker::Address.country
        )
      end
    end
    end
end
