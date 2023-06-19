class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores, id: :uuid do |t|
      t.references :owner, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description
      t.string :location
      t.string :open_time
      t.string :close_time
      t.boolean :open_weekends
      t.boolean :open_public_holidays
      t.boolean :open_24hrs
      t.boolean :open_24hrs_weekends

      t.timestamps
    end
  end
end
