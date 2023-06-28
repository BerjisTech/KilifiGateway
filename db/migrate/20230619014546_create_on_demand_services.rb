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
      t.float :discount
      t.float :tax

      t.timestamps
    end
  end
end
