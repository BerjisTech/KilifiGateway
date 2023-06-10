# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :user, optional: true
end
