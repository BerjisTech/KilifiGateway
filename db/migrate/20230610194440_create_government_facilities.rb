class CreateGovernmentFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :government_facilities, id: :uuid do |t|
      t.string :name
      t.string :type
      t.string :location

      t.timestamps
    end
  end
end
