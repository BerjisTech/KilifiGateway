# frozen_string_literal: true

class CreateOnDemandServices < ActiveRecord::Migration[7.0]
  def change
    create_table :on_demand_services, id: :uuid do |t|
      t.references :service_provider, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description
      t.string :service_type
      t.string :service_category
      t.string :service_sub_category
      t.float :duration
      t.float :duration_unit
      t.float :distance
      t.float :distance_unit
      t.float :price
      t.string :price_rate
      t.float :discount
      t.float :tax
      t.float :rating, default: 0
      t.integer :rating_count, default: 0
      t.boolean :is_active, default: true
      t.boolean :is_deleted, default: false
      t.boolean :is_featured, default: false
      t.boolean :is_popular, default: false
      t.boolean :is_new, default: false
      t.boolean :is_recommended, default: false
      t.boolean :is_verified, default: false
      t.boolean :is_visible, default: true
      t.boolean :is_available, default: true

      t.timestamps
    end
  end
end
