class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.references :store, null: false, foreign_key: true, type: :uuid
      t.references :branch, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description
      t.string :product_type
      t.string :product_category
      t.string :product_sub_category
      t.string :color
      t.string :size
      t.string :weight
      t.string :weight_unit
      t.string :dimension
      t.string :dimension_unit
      t.string :sku
      t.string :barcode
      t.string :manufacturer
      t.string :brand
      t.string :model
      t.string :origin
      t.string :condition
      t.string :condition_note
      t.string :warranty
      t.string :warranty_period
      t.string :warranty_policy
      t.string :return_policy
      t.string :return_period
      t.float :price
      t.float :discount
      t.float :tax
      t.float :shipping_fee
      t.float :shipping_discount
      t.float :shipping_discount_price
      t.float :shipping_tax
      t.float :shipping_weight
      t.float :shipping_weight_unit
      t.float :shipping_dimension
      t.float :shipping_dimension_unit
      t.float :shipping_distance
      t.float :shipping_distance_unit
      t.float :shipping_duration
      t.boolean :featured
      t.boolean :best_seller
      t.boolean :new_arrival
      t.boolean :on_display
      t.boolean :on_sale
      t.boolean :on_auction
      t.boolean :on_rent
      t.boolean :on_demand
      t.boolean :on_pre_order

      t.timestamps
    end
  end
end
