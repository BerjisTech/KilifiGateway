# frozen_string_literal: true

class CreateGovernmentFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :government_facilities, id: :uuid do |t|
      t.string :name
      t.string :facility_type
      t.string :location
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :phone
      t.string :email
      t.string :website
      t.string :contact

      t.timestamps
    end
  end
end
