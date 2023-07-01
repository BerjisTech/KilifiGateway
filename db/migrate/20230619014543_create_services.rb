# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services, id: :uuid do |t|
      t.references :store, null: false, foreign_key: true, type: :uuid
      t.references :branch, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description
      t.string :service_type
      t.string :service_category
      t.string :service_sub_category
      t.string :sku
      t.float :price
      t.float :discount
      t.float :tax
      t.boolean :featured
      t.boolean :best_seller
      t.boolean :new_arrival
      t.boolean :on_display
      t.boolean :on_sale
      t.boolean :on_demand

      t.timestamps
    end
  end
end
