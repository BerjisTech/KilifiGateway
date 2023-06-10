# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :store
  belongs_to :branch
end
