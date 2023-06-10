# frozen_string_literal: true

class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches, id: :uuid do |t|
      t.string :term
      t.string :category
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :ip
      t.string :location
      t.string :referer

      t.timestamps
    end
  end
end
