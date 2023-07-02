# frozen_string_literal: true

class Owner < ApplicationRecord
  belongs_to :user
  has_many :accomodations
  has_many :stores
  has_many :branches, through: :stores
  has_many :staffs, through: :stores
  has_many :products, through: :branches
  has_many :services, through: :branches
end
