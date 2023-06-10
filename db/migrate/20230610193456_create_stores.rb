# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores, id: :uuid do |t|
      t.references :owner, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
