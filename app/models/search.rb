# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :user, optional: true

  class << self
    def fake_records
      10.times do
        Search.create(
          term: Faker::Lorem.word,
          category: Faker::Lorem.word,
          user: User.all.sample,
          ip: Faker::Internet.ip_v4_address,
          location: Faker::Address.full_address,
          referer: Faker::Internet.url
        )
      end
    end
  end
end