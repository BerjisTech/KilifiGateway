# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :wallet, null: false, foreign_key: true, type: :uuid
      t.integer :amount
      t.integer :fees
      t.float :conversion_rate
      t.text :details
      t.string :transaction_type
      t.string :transaction_category
      t.string :transaction_sub_category
      t.string :transaction_status
      t.string :transaction_mode
      t.string :transaction_method

      t.timestamps
    end
  end
end
