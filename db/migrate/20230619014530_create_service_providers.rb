class CreateServiceProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_providers, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :email
      t.string :phone_number
      t.boolean :email_verified
      t.boolean :phone_number_verified
      t.boolean :available
      t.boolean :online
      t.float :average_rating
      t.integer :number_of_ratings
      t.string :currency
      t.string :bio
      t.string :location
      t.float :jobs_done
      t.float :total_earnings

      t.timestamps
    end
  end
end
