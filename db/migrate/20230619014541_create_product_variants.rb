# frozen_string_literal: true

class CreateProductVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :product_variants, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :descritpion
      t.string :variant_type
      t.float :price
      t.float :discount
      t.json :variant_select_choices
      t.boolean :best_seller
      t.boolean :on_demand
      t.boolean :on_sale

      t.timestamps
    end
  end
end
