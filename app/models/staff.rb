# frozen_string_literal: true

class Staff < ApplicationRecord
  belongs_to :user
  belongs_to :branch
  belongs_to :store
end
