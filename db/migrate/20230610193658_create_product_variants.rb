# frozen_string_literal: true

class CreateProductVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :product_variants, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
