class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :currency, default: "USD"
      t.float :amount, default: 0
      t.float :conversion_rate

      t.timestamps
    end
  end
end

