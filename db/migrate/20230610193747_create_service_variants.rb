# frozen_string_literal: true

class CreateServiceVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :service_variants, id: :uuid do |t|
      t.references :service, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
