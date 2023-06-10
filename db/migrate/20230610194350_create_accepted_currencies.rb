# frozen_string_literal: true

class CreateAcceptedCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :accepted_currencies, id: :uuid do |t|
      t.string :code, limit: 2
      t.string :code_three, limit: 3
      t.string :country
      t.string :name
      t.float :value_against_dollar
      t.float :conversion_rate

      t.timestamps
    end
  end
end
