# frozen_string_literal: true

class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :branch, null: false, foreign_key: true, type: :uuid
      t.references :store, null: false, foreign_key: true, type: :uuid
      t.date :date_joined
      t.date :date_left
      t.string :staff_type
      t.string :staff_category
      t.string :staff_sub_category
      t.string :staff_status
      t.string :staff_role
      t.string :staff_position
      t.string :staff_department
      t.string :staff_designation

      t.timestamps
    end
  end
end
