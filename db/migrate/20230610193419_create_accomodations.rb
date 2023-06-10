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

      t.timestamps
    end
  end
end
