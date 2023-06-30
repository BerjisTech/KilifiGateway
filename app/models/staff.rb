# frozen_string_literal: true

class Staff < ApplicationRecord
  belongs_to :user
  belongs_to :branch
  has_one :store, through: :branch
  has_many :products, through: :branch
  has_many :services, through: :branch
end
