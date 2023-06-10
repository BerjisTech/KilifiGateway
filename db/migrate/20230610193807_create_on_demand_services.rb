class CreateOnDemandServices < ActiveRecord::Migration[7.0]
  def change
    create_table :on_demand_services, id: :uuid do |t|
      t.references :service_provider, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
