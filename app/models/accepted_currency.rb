# frozen_string_literal: true

class AcceptedCurrency < ApplicationRecord

  # Associations
  has_many :wallets

  class << self
    def fake_records
      10.times do
        AcceptedCurrency.create(
          code: Faker::Currency.code[0..1],
          code_three: Faker::Currency.code,
          country: Faker::Address.country,
          name: Faker::Currency.name,
          value_against_dollar: Faker::Number.decimal,
          conversion_rate: Faker::Number.decimal
        )
      end
    end
    end
end
