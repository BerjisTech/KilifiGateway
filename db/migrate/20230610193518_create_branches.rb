class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches, id: :uuid do |t|
      t.references :store, null: false, foreign_key: true, type: :uuid
      t.string :location

      t.timestamps
    end
  end
end
