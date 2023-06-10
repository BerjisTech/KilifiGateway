class CreateStoreContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :store_contacts, id: :uuid do |t|
      t.references :store, null: false, foreign_key: true, type: :uuid
      t.references :branch, null: false, foreign_key: true, type: :uuid
      t.string :contact_info

      t.timestamps
    end
  end
end
