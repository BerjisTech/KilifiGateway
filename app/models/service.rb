# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :store
  belongs_to :branch
end
