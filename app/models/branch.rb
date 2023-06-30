# frozen_string_literal: true

class Branch < ApplicationRecord
  belongs_to :store
  has_many :products
  has_many :services
  has_many :staffs
end
