# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable
  has_one :service_provider, dependent: :destroy
  has_one :owner, dependent: :destroy
  has_many :staffs, dependent: :destroy
  has_many :branches, through: :staffs
  has_many :stores, through: :branches
  has_many :products, through: :branches
  has_many :services, through: :branches
  has_many :on_demand_services, through: :service_provider
  has_many :accomodations, through: :owner

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

    def debug_reset_suggest
      User.where(email: 'bo.kouru@gmail.com').update_all(suggest_service_provider_guide: true,
                                                         suggest_owner_guide: true, suggest_property_guide: true)
    end
  end
end
