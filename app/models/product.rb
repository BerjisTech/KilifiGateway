# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :branch
  has_one :store, through: :branch
  has_one :owner, through: :store
  has_one :user, through: :owner
  has_many :product_variants
end
