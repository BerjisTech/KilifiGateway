# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable

  class << self
    def fake_records
      10.times do
        User.create(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: Faker::Internet.password
        )
      end
    end
  end
end
