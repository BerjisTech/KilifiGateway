# frozen_string_literal: true

class CreateAccomodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accomodations, id: :uuid do |t|
      t.references :owner, null: false, foreign_key: true, type: :uuid
      t.text :description
      t.integer :bathrooms
      t.integer :bedrooms
      t.boolean :balcony
      t.string :location
      t.string :name
      t.float :price
      t.float :rating
      t.float :latitude
      t.float :longitude
      t.json :amenities
      t.string :currency
      t.integer :max_guests
      t.integer :min_stay
      t.integer :max_stay
      t.integer :guests_included
      t.integer :extra_guest_fee
      t.integer :cleaning_fee
      t.integer :security_deposit
      t.integer :service_fee
      t.integer :host_fee
      t.integer :cancellation_policy
      t.integer :cancellation_days
      t.integer :cancellation_penalty
      t.integer :cancellation_rate

      t.timestamps
    end
  end
end
