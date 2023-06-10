# frozen_string_literal: true

class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :branch, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
