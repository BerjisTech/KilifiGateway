# frozen_string_literal: true

class Owner < ApplicationRecord
  belongs_to :user
  has_many :accomodations
  has_many :stores
end
