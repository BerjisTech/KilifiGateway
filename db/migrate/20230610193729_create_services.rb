# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services, id: :uuid do |t|
      t.references :store, null: false, foreign_key: true, type: :uuid
      t.references :branch, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
