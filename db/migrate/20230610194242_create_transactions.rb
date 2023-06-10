class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :wallet, null: false, foreign_key: true, type: :uuid
      t.integer :amount
      t.integer :fees
      t.float :conversion_rate
      t.text :details

      t.timestamps
    end
  end
end
