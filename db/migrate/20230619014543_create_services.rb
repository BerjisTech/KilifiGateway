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

      t.timestamps
    end
  end
end
