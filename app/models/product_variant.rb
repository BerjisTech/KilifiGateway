# frozen_string_literal: true

class ProductVariant < ApplicationRecord
  belongs_to :product

  class << self
    def fake_records
      10.times do
        ProductVariant.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          product_id: Product.all.sample.id
        )
      end
    end
  end
end
