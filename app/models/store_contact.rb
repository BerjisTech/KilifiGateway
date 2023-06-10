# frozen_string_literal: true

class StoreContact < ApplicationRecord
  belongs_to :store
  belongs_to :branch
end
