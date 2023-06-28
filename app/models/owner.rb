# frozen_string_literal: true

class Owner < ApplicationRecord
  belongs_to :user
end
