# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :owner
  has_one :user, through: :owner
  has_many :branches
  has_many :products, through: :branches
  has_many :services, through: :branches
  has_many :staffs, through: :branches
end
