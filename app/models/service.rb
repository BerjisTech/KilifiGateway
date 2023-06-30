# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :branch
  has_one :store, through: :branch
  has_one :owner, through: :store
  has_one :user, through: :owner
  has_many :service_variants
end
