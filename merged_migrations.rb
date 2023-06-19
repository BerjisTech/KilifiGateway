rails g scaffold Owner user:references --skip-collision-check --skip && 
rails g scaffold ServiceProvider user:references email phone_number email_verified:boolean phone_number_verified:boolean available:boolean online:boolean average_rating:float number_of_ratings:integer currency bio location jobs_done:float total_earnings:float --skip-collision-check --skip &&
rails g scaffold Accomodation owner:references description:text bathrooms:integer bedrooms:integer balcony:boolean location name price:float rating:float latitude:float longitude:float amenities:json currency max_guests:integer min_stay:integer max_stay:integer guests_included:integer extra_guest_fee:integer cleaning_fee:integer security_deposit:integer service_fee:integer host_fee:integer cancellation_policy:integer cancellation_days:integer cancellation_penalty:integer cancellation_rate:integer --skip-collision-check --skip && 
rails g scaffold Store owner:references name description:text location open_time close_time open_weekends:boolean open_public_holidays:boolean open_24hrs:boolean open_24hrs_weekends:boolean --skip-collision-check --skip && 
rails g scaffold Branch store:references location open_time close_time open_weekends:boolean open_public_holidays:boolean open_24hrs:boolean open_24hrs_weekends:boolean --skip-collision-check --skip && 
rails g scaffold Staff user:references branch:references store:references date_joined:date date_left:date staff_type staff_category staff_sub_category staff_status staff_role staff_position staff_department staff_designation --skip-collision-check --skip && 
rails g scaffold StoreContact store:references branch:references contact_info --skip-collision-check --skip && 
rails g scaffold Product store:references branch:references name description:text product_type product_category product_sub_category color size weight weight_unit dimension dimension_unit sku barcode manufacturer brand model origin condition condition_note warranty warranty_period warranty_policy return_policy return_period price:float discount:float tax:float shipping_fee:float shipping_discount:float shipping_discount_price:float shipping_tax:float shipping_weight:float shipping_weight_unit:float shipping_dimension:float shipping_dimension_unit:float shipping_distance:float shipping_distance_unit:float shipping_duration:float featured:boolean best_seller:boolean new_arrival:boolean on_display:boolean on_sale:boolean on_auction:boolean on_rent:boolean on_demand:boolean on_pre_order:boolean --skip-collision-check --skip && 
rails g scaffold ProductVariant product:references name description:text color size weight weight_unit dimension dimension_unit sku barcode manufacturer brand model origin condition condition_note warranty warranty_period warranty_policy return_policy return_period price:float discount:float tax:float shipping_fee:float shipping_discount:float shipping_discount_price:float shipping_tax:float shipping_weight:float shipping_weight_unit:float shipping_dimension:float shipping_dimension_unit:float shipping_distance:float shipping_distance_unit:float shipping_duration:float featured:boolean best_seller:boolean new_arrival:boolean on_display:boolean on_sale:boolean on_auction:boolean on_rent:boolean on_demand:boolean on_pre_order:boolean --skip-collision-check --skip && 
rails g scaffold Service store:references branch:references name description:text service_type service_category service_sub_category --skip-collision-check --skip && 
rails g scaffold ServiceVariant service:references name description:text --skip-collision-check --skip && 
rails g scaffold OnDemandService service_provider:references name description:text service_type service_category service_sub_category duration:float duration_unit:float distance:float distance_unit:float price:float discount:float tax:float --skip-collision-check --skip && 
rails g scaffold Wallet user:references currency amount:float conversion_rate:float --skip-collision-check --skip && 
rails g scaffold Transaction wallet:references amount:integer fees:integer conversion_rate:float details:text transaction_type transaction_category transaction_sub_category transaction_status transaction_mode transaction_method --skip-collision-check --skip && 
rails g scaffold AcceptedCurrency code code_three country name value_against_dollar:float conversion_rate:float --skip-collision-check --skip && 
rails g scaffold GovernmentFacility name facility_type location address city state country pincode phone email website contact --skip-collision-check --skip && 
rails g scaffold Search term category user:references ip location referer --skip-collision-check --skip

# Fake data with faker for the above models
10.times do
    Owner.create(user: User.all.sample)
end

10.times do
    ServiceProvider.create(user: User.all.sample, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, email_verified: Faker::Boolean.boolean, phone_number_verified: Faker::Boolean.boolean, available: Faker::Boolean.boolean, online: Faker::Boolean.boolean, average_rating: Faker::Number.decimal(l_digits: 2), number_of_ratings: Faker::Number.number(digits: 2), currency: Faker::Currency.code, bio: Faker::Lorem.paragraph, location: Faker::Address.full_address, jobs_done: Faker::Number.decimal(l_digits: 2), total_earnings: Faker::Number.decimal(l_digits: 2))
end

10.times do
    Accomodation.create(owner: Owner.all.sample, description: Faker::Lorem.paragraph, bathrooms: Faker::Number.number(digits: 1), bedrooms: Faker::Number.number(digits: 1), balcony: Faker::Boolean.boolean, location: Faker::Address.full_address, name: Faker::Lorem.word, price: Faker::Number.decimal(l_digits: 2), rating: Faker::Number.decimal(l_digits: 2), latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, amenities: Faker::Lorem.paragraph, currency: Faker::Currency.code, max_guests: Faker::Number.number(digits: 1), min_stay: Faker::Number.number(digits: 1), max_stay: Faker::Number.number(digits: 1), guests_included: Faker::Number.number(digits: 1), extra_guest_fee: Faker::Number.number(digits: 1), cleaning_fee: Faker::Number.number(digits: 1), security_deposit: Faker::Number.number(digits: 1), service_fee: Faker::Number.number(digits: 1), host_fee: Faker::Number.number(digits: 1), cancellation_policy: Faker::Number.number(digits: 1), cancellation_days: Faker::Number.number(digits: 1), cancellation_penalty: Faker::Number.number(digits: 1), cancellation_rate: Faker::Number.number(digits: 1))
end

10.times do
    Store.create(owner: Owner.all.sample, name: Faker::Lorem.word, description: Faker::Lorem.paragraph, location: Faker::Address.full_address, open_time: Faker::Time.forward(days: 1, period: :morning), close_time: Faker::Time.forward(days: 1, period: :evening), open_weekends: Faker::Boolean.boolean, open_public_holidays: Faker::Boolean.boolean, open_24hrs: Faker::Boolean.boolean, open_24hrs_weekends: Faker::Boolean.boolean)
end

10.times do
    Branch.create(store: Store.all.sample, location: Faker::Address.full_address, open_time: Faker::Time.forward(days: 1, period: :morning), close_time: Faker::Time.forward(days: 1, period: :evening), open_weekends: Faker::Boolean.boolean, open_public_holidays: Faker::Boolean.boolean, open_24hrs: Faker::Boolean.boolean, open_24hrs_weekends: Faker::Boolean.boolean)
end

10.times do
    Staff.create(user: User.all.sample, branch: Branch.all.sample, store: Store.all.sample, date_joined: Faker::Date.backward(days: 14), date_left: Faker::Date.backward(days: 14), staff_type: Faker::Lorem.word, staff_category: Faker::Lorem.word, staff_sub_category: Faker::Lorem.word, staff_status: Faker::Lorem.word, staff_role: Faker::Lorem.word, staff_position: Faker::Lorem.word, staff_department: Faker::Lorem.word, staff_designation: Faker::Lorem.word)
end

10.times do
    StoreContact.create(store: Store.all.sample, branch: Branch.all.sample, contact_info: Faker::Lorem.paragraph)
end

10.times do
    Product.create(store: Store.all.sample, branch: Branch.all.sample, name: Faker::Lorem.word, description: Faker::Lorem.paragraph, product_type: Faker::Lorem.word, product_category: Faker::Lorem.word, product_sub_category: Faker::Lorem.word, color: Faker::Color.color_name, size: Faker::Lorem.word, weight: Faker::Number.decimal(l_digits: 2), weight_unit: Faker::Lorem.word, dimension: Faker::Number.decimal(l_digits: 2), dimension_unit: Faker::Lorem.word, sku: Faker::Lorem.word, barcode: Faker::Lorem.word, manufacturer: Faker::Lorem.word, brand: Faker::Lorem.word, model: Faker::Lorem.word, origin: Faker::Lorem.word, condition: Faker::Lorem.word, condition_note: Faker::Lorem.paragraph, warranty: Faker::Boolean.boolean, warranty_period: Faker::Number.number(digits: 1), warranty_policy: Faker::Lorem.paragraph, return_policy: Faker::Lorem.paragraph, return_period: Faker::Number.number(digits: 1), price: Faker::Number.decimal(l_digits: 2), discount: Faker::Number.decimal(l_digits: 2), tax: Faker::Number.decimal(l_digits: 2), shipping_fee: Faker::Number.decimal(l_digits: 2), shipping_discount: Faker::Number.decimal(l_digits: 2), shipping_discount_price: Faker::Number.decimal(l_digits: 2), shipping_tax: Faker::Number.decimal(l_digits: 2), shipping_weight: Faker::Number.decimal(l_digits: 2), shipping_weight_unit: Faker::Lorem.word, shipping_dimension: Faker::Number.decimal(l_digits: 2), shipping_dimension_unit: Faker::Lorem.word, shipping_distance: Faker::Number.decimal(l_digits: 2), shipping_distance_unit: Faker::Lorem.word, shipping_duration: Faker::Number.decimal(l_digits: 2), featured: Faker::Boolean.boolean, best_seller: Faker::Boolean.boolean, new_arrival: Faker::Boolean.boolean, on_display: Faker::Boolean.boolean, on_sale: Faker::Boolean.boolean, on_auction: Faker::Boolean.boolean, on_rent: Faker::Boolean.boolean, on_demand: Faker::Boolean.boolean, on_pre_order: Faker::Boolean.boolean)
end

10.times do
    ProductVariant.create(product: Product.all.sample, name: Faker::Lorem.word, description: Faker::Lorem.paragraph, color: Faker::Color.color_name, size: Faker::Lorem.word, weight: Faker::Number.decimal(l_digits: 2), weight_unit: Faker::Lorem.word, dimension: Faker::Number.decimal(l_digits: 2), dimension_unit: Faker::Lorem.word, sku: Faker::Lorem.word, barcode: Faker::Lorem.word, manufacturer: Faker::Lorem.word, brand: Faker::Lorem.word, model: Faker::Lorem.word, origin: Faker::Lorem.word, condition: Faker::Lorem.word, condition_note: Faker::Lorem.paragraph, warranty: Faker::Boolean.boolean, warranty_period: Faker::Number.number(digits: 1), warranty_policy: Faker::Lorem.paragraph, return_policy: Faker::Lorem.paragraph, return_period: Faker::Number.number(digits: 1), price: Faker::Number.decimal(l_digits: 2), discount: Faker::Number.decimal(l_digits: 2), tax: Faker::Number.decimal(l_digits: 2), shipping_fee: Faker::Number.decimal(l_digits: 2), shipping_discount: Faker::Number.decimal(l_digits: 2), shipping_discount_price: Faker::Number.decimal(l_digits: 2), shipping_tax: Faker::Number.decimal(l_digits: 2), shipping_weight: Faker::Number.decimal(l_digits: 2), shipping_weight_unit: Faker::Lorem.word, shipping_dimension: Faker::Number.decimal(l_digits: 2), shipping_dimension_unit: Faker::Lorem.word, shipping_distance: Faker::Number.decimal(l_digits: 2), shipping_distance_unit: Faker::Lorem.word, shipping_duration: Faker::Number.decimal(l_digits: 2), featured: Faker::Boolean.boolean, best_seller: Faker::Boolean.boolean, new_arrival: Faker::Boolean.boolean, on_display: Faker::Boolean.boolean, on_sale: Faker::Boolean.boolean, on_auction: Faker::Boolean.boolean, on_rent: Faker::Boolean.boolean, on_demand: Faker::Boolean.boolean, on_pre_order: Faker::Boolean.boolean)
end

10.times do
    Service.create(store: Store.all.sample, branch: Branch.all.sample, name: Faker::Lorem.word, description: Faker::Lorem.paragraph, service_type: Faker::Lorem.word, service_category: Faker::Lorem.word, service_sub_category: Faker::Lorem.word)
end

10.times do
    ServiceVariant.create(service: Service.all.sample, name: Faker::Lorem.word, description: Faker::Lorem.paragraph)
end

10.times do
    OnDemandService.create(service_provider: ServiceProvider.all.sample, name: Faker::Lorem.word, description: Faker::Lorem.paragraph, service_type: Faker::Lorem.word, service_category: Faker::Lorem.word, service_sub_category: Faker::Lorem.word, duration: Faker::Number.decimal(l_digits: 2), duration_unit: Faker::Lorem.word, distance: Faker::Number.decimal(l_digits: 2), distance_unit: Faker::Lorem.word, price: Faker::Number.decimal(l_digits: 2), discount: Faker::Number.decimal(l_digits: 2), tax: Faker::Number.decimal(l_digits: 2))
end

10.times do
    Wallet.create(user: User.all.sample, currency: Faker::Currency.code, amount: Faker::Number.decimal(l_digits: 2), conversion_rate: Faker::Number.decimal(l_digits: 2))
end

10.times do
    Transaction.create(wallet: Wallet.all.sample, amount: Faker::Number.number(digits: 3), fees: Faker::Number.number(digits: 3), conversion_rate: Faker::Number.decimal(l_digits: 2), details: Faker::Lorem.paragraph, transaction_type: Faker::Lorem.word, transaction_category: Faker::Lorem.word, transaction_sub_category: Faker::Lorem.word, transaction_status: Faker::Lorem.word, transaction_mode: Faker::Lorem.word, transaction_method: Faker::Lorem.word)
end

10.times do
    AcceptedCurrency.create(code: Faker::Lorem.word, code_three: Faker::Lorem.word, country: Faker::Lorem.word, name: Faker::Lorem.word, value_against_dollar: Faker::Number.decimal(l_digits: 2), conversion_rate: Faker::Number.decimal(l_digits: 2))
end

10.times do
    GovernmentFacility.create(name: Faker::Lorem.word, facility_type: Faker::Lorem.word, location: Faker::Address.full_address, address: Faker::Address.full_address, city: Faker::Address.city, state: Faker::Address.state, country: Faker::Address.country, pincode: Faker::Address.zip_code, phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, website: Faker::Internet.url, contact: Faker::Lorem.paragraph)
end

10.times do
    Search.create(term: Faker::Lorem.word, category: Faker::Lorem.word, user: User.all.sample, ip: Faker::Internet.ip_v4_address, location: Faker::Address.full_address, referer: Faker::Internet.url)
end

# Add foreign keys to the above models
rails g migration AddForeignKeysToModels --skip-collision-check --skip &&
# Path: add_foreign_keys_to_models.rb
# Compare this snippet from db/migrate/20210913100000_add_foreign_keys_to_models.rb:
# # frozen_string_literal: true
#
# class AddForeignKeysToModels < ActiveRecord::Migration[6.1]
#   def change
#     add_reference :owners, :user, null: false, foreign_key: true
#     add_reference :service_providers, :user, null: false, foreign_key: true
#     add_reference :accomodations, :owner, null: false, foreign_key: true
#     add_reference :stores, :owner, null: false, foreign_key: true
#     add_reference :branches, :store, null: false, foreign_key: true
#     add_reference :branches, :store, null: false, foreign_key: true
#     add_reference :staffs, :user, null: false, foreign_key: true
#     add_reference :staffs, :branch, null: false, foreign_key: true
#     add_reference :staffs, :store, null: false, foreign_key: true
#     add_reference :store_contacts, :store, null: false, foreign_key: true
#     add_reference :store_contacts, :branch, null: false, foreign_key: true
#     add_reference :products, :store, null: false, foreign_key: true
#     add_reference :products, :branch, null: false, foreign_key: true
#     add_reference :product_variants, :product, null: false, foreign_key: true
#     add_reference :services, :store, null: false, foreign_key: true
#     add_reference :services, :branch, null: false, foreign_key: true
#     add_reference :service_variants, :service, null: false, foreign_key: true
#     add_reference :on_demand_services, :service_provider, null: false, foreign_key: true
#     add_reference :wallets, :user, null: false, foreign_key: true
#     add_reference :transactions, :wallet, null: false, foreign_key: true
#     add_reference :accepted_currencies, :user, null: false, foreign_key: true
#     add_reference :government_facilities, :user, null: false, foreign_key: true
#     add_reference :searches, :user, null: false, foreign_key: true
#   end
# end
rails db:migrate &&
rails db:seed &&
rails s -p 3000 -b
