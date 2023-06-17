# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :user, optional: true

  class << self
    def fake_records
      10.times do
        Search.create(
          name: Faker::Company.name,
          description: Faker::Company.catch_phrase,
          user_id: User.all.sample.id
        )
      end
    end
  end
end
