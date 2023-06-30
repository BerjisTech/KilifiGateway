# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_19_014554) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accepted_currencies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.string "code_three"
    t.string "country"
    t.string "name"
    t.float "value_against_dollar"
    t.float "conversion_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accomodations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "owner_id", null: false
    t.text "description"
    t.integer "bathrooms"
    t.integer "bedrooms"
    t.boolean "balcony"
    t.boolean "parking"
    t.boolean "transport"
    t.string "location"
    t.string "name"
    t.float "price"
    t.float "rating"
    t.float "latitude"
    t.float "longitude"
    t.json "amenities"
    t.string "currency"
    t.integer "max_guests"
    t.integer "min_stay"
    t.integer "max_stay"
    t.integer "guests_included"
    t.integer "extra_guest_fee"
    t.integer "cleaning_fee"
    t.integer "security_deposit"
    t.integer "service_fee"
    t.integer "host_fee"
    t.integer "cancellation_policy"
    t.integer "cancellation_days"
    t.integer "cancellation_penalty"
    t.integer "cancellation_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_accomodations_on_owner_id"
  end

  create_table "branches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "store_id", null: false
    t.string "location"
    t.string "open_time"
    t.string "close_time"
    t.boolean "open_weekends"
    t.boolean "open_public_holidays"
    t.boolean "open_24hrs"
    t.boolean "open_24hrs_weekends"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_branches_on_store_id"
  end

  create_table "government_facilities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "facility_type"
    t.string "location"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "on_demand_services", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "service_provider_id", null: false
    t.string "name"
    t.text "description"
    t.string "service_type"
    t.string "service_category"
    t.string "service_sub_category"
    t.float "duration"
    t.float "duration_unit"
    t.float "distance"
    t.float "distance_unit"
    t.float "price"
    t.float "discount"
    t.float "tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_provider_id"], name: "index_on_demand_services_on_service_provider_id"
  end

  create_table "owners", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "product_variants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "product_id", null: false
    t.string "name"
    t.text "description"
    t.string "color"
    t.string "size"
    t.string "weight"
    t.string "weight_unit"
    t.string "dimension"
    t.string "dimension_unit"
    t.string "sku"
    t.string "barcode"
    t.string "manufacturer"
    t.string "brand"
    t.string "model"
    t.string "origin"
    t.string "condition"
    t.string "condition_note"
    t.string "warranty"
    t.string "warranty_period"
    t.string "warranty_policy"
    t.string "return_policy"
    t.string "return_period"
    t.float "price"
    t.float "discount"
    t.float "tax"
    t.float "shipping_fee"
    t.float "shipping_discount"
    t.float "shipping_discount_price"
    t.float "shipping_tax"
    t.float "shipping_weight"
    t.float "shipping_weight_unit"
    t.float "shipping_dimension"
    t.float "shipping_dimension_unit"
    t.float "shipping_distance"
    t.float "shipping_distance_unit"
    t.float "shipping_duration"
    t.boolean "featured"
    t.boolean "best_seller"
    t.boolean "new_arrival"
    t.boolean "on_display"
    t.boolean "on_sale"
    t.boolean "on_auction"
    t.boolean "on_rent"
    t.boolean "on_demand"
    t.boolean "on_pre_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "store_id", null: false
    t.uuid "branch_id", null: false
    t.string "name"
    t.text "description"
    t.string "product_type"
    t.string "product_category"
    t.string "product_sub_category"
    t.string "color"
    t.string "size"
    t.string "weight"
    t.string "weight_unit"
    t.string "dimension"
    t.string "dimension_unit"
    t.string "sku"
    t.string "barcode"
    t.string "manufacturer"
    t.string "brand"
    t.string "model"
    t.string "origin"
    t.string "condition"
    t.string "condition_note"
    t.string "warranty"
    t.string "warranty_period"
    t.string "warranty_policy"
    t.string "return_policy"
    t.string "return_period"
    t.float "price"
    t.float "discount"
    t.float "tax"
    t.float "shipping_fee"
    t.float "shipping_discount"
    t.float "shipping_discount_price"
    t.float "shipping_tax"
    t.float "shipping_weight"
    t.float "shipping_weight_unit"
    t.float "shipping_dimension"
    t.float "shipping_dimension_unit"
    t.float "shipping_distance"
    t.float "shipping_distance_unit"
    t.float "shipping_duration"
    t.boolean "featured"
    t.boolean "best_seller"
    t.boolean "new_arrival"
    t.boolean "on_display"
    t.boolean "on_sale"
    t.boolean "on_auction"
    t.boolean "on_rent"
    t.boolean "on_demand"
    t.boolean "on_pre_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_products_on_branch_id"
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "searches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "term"
    t.string "category"
    t.uuid "user_id", null: false
    t.string "ip"
    t.string "location"
    t.string "referer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "service_providers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "email"
    t.string "phone_number"
    t.boolean "email_verified"
    t.boolean "phone_number_verified"
    t.boolean "available"
    t.boolean "online"
    t.float "average_rating"
    t.integer "number_of_ratings"
    t.string "currency"
    t.string "bio"
    t.string "location"
    t.float "jobs_done"
    t.float "total_earnings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_service_providers_on_user_id"
  end

  create_table "service_variants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "service_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_service_variants_on_service_id"
  end

  create_table "services", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "store_id", null: false
    t.uuid "branch_id", null: false
    t.string "name"
    t.text "description"
    t.string "service_type"
    t.string "service_category"
    t.string "service_sub_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_services_on_branch_id"
    t.index ["store_id"], name: "index_services_on_store_id"
  end

  create_table "staffs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "branch_id", null: false
    t.uuid "store_id", null: false
    t.date "date_joined"
    t.date "date_left"
    t.string "staff_type"
    t.string "staff_category"
    t.string "staff_sub_category"
    t.string "staff_status"
    t.string "staff_role"
    t.string "staff_position"
    t.string "staff_department"
    t.string "staff_designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_staffs_on_branch_id"
    t.index ["store_id"], name: "index_staffs_on_store_id"
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "store_contacts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "store_id", null: false
    t.uuid "branch_id", null: false
    t.string "contact_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_store_contacts_on_branch_id"
    t.index ["store_id"], name: "index_store_contacts_on_store_id"
  end

  create_table "stores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "owner_id", null: false
    t.string "name"
    t.text "description"
    t.string "location"
    t.string "open_time"
    t.string "close_time"
    t.boolean "open_weekends"
    t.boolean "open_public_holidays"
    t.boolean "open_24hrs"
    t.boolean "open_24hrs_weekends"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_stores_on_owner_id"
  end

  create_table "transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "wallet_id", null: false
    t.integer "amount"
    t.integer "fees"
    t.float "conversion_rate"
    t.text "details"
    t.string "transaction_type"
    t.string "transaction_category"
    t.string "transaction_sub_category"
    t.string "transaction_status"
    t.string "transaction_mode"
    t.string "transaction_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_transactions_on_wallet_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "postal_code"
    t.string "state"
    t.string "timezone"
    t.string "currency"
    t.string "language"
    t.boolean "admin", default: false, null: false
    t.boolean "suggest_owner_guide", default: true, null: false
    t.boolean "suggest_service_provider_guide", default: true, null: false
    t.boolean "suggest_property_guide", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "wallets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "currency"
    t.float "amount"
    t.float "conversion_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "accomodations", "owners"
  add_foreign_key "branches", "stores"
  add_foreign_key "on_demand_services", "service_providers"
  add_foreign_key "owners", "users"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "branches"
  add_foreign_key "products", "stores"
  add_foreign_key "searches", "users"
  add_foreign_key "service_providers", "users"
  add_foreign_key "service_variants", "services"
  add_foreign_key "services", "branches"
  add_foreign_key "services", "stores"
  add_foreign_key "staffs", "branches"
  add_foreign_key "staffs", "stores"
  add_foreign_key "staffs", "users"
  add_foreign_key "store_contacts", "branches"
  add_foreign_key "store_contacts", "stores"
  add_foreign_key "stores", "owners"
  add_foreign_key "transactions", "wallets"
  add_foreign_key "wallets", "users"
end
