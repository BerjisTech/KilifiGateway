# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create!(name: "Luke", movie: movies.first)

# Generate fake data for all models with gem faker

sombo = User.create(name: 'Lord Sombo', email: 'bo.kouru@gmail.com', password: 'password')
10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
end

10.times do
  Owner.create!(user: User.where.not(id: sombo.id).sample)
end

10.times do
  ServiceProvider.create!(user: User.where.not(id: sombo.id).sample, email: Faker::Internet.email,
                          phone_number: Faker::PhoneNumber.phone_number, email_verified: Faker::Boolean.boolean, phone_number_verified: Faker::Boolean.boolean, available: Faker::Boolean.boolean, online: Faker::Boolean.boolean, average_rating: Faker::Number.decimal(l_digits: 2), number_of_ratings: Faker::Number.number(digits: 2), currency: Faker::Currency.code, bio: Faker::Lorem.paragraph, location: Faker::Address.full_address, jobs_done: Faker::Number.decimal(l_digits: 2), total_earnings: Faker::Number.decimal(l_digits: 2))
end

Owner.all.each do |owner|
  Accomodation.create!(owner: owner, description: Faker::Lorem.paragraph,
                       bathrooms: Faker::Number.number(digits: 1), bedrooms: Faker::Number.number(digits: 1), balcony: Faker::Boolean.boolean, location: Faker::Address.full_address, name: Faker::Lorem.word, price: Faker::Number.decimal(l_digits: 2), rating: Faker::Number.decimal(l_digits: 2), latitude: Faker::Address.latitude, longitude: Faker::Address.longitude, amenities: Faker::Lorem.paragraph, currency: Faker::Currency.code, max_guests: Faker::Number.number(digits: 1), min_stay: Faker::Number.number(digits: 1), max_stay: Faker::Number.number(digits: 1), guests_included: Faker::Number.number(digits: 1), extra_guest_fee: Faker::Number.number(digits: 1), cleaning_fee: Faker::Number.number(digits: 1), security_deposit: Faker::Number.number(digits: 1), service_fee: Faker::Number.number(digits: 1), host_fee: Faker::Number.number(digits: 1), cancellation_policy: Faker::Number.number(digits: 1), cancellation_days: Faker::Number.number(digits: 1), cancellation_penalty: Faker::Number.number(digits: 1), cancellation_rate: Faker::Number.number(digits: 1))
end

Owner.all.each do |owner|
  Store.create!(owner: owner, name: Faker::Lorem.word, description: Faker::Lorem.paragraph,
                location: Faker::Address.full_address, open_time: Faker::Time.forward(days: 1, period: :morning), close_time: Faker::Time.forward(days: 1, period: :evening), open_weekends: Faker::Boolean.boolean, open_public_holidays: Faker::Boolean.boolean, open_24hrs: Faker::Boolean.boolean, open_24hrs_weekends: Faker::Boolean.boolean)
end

Store.all.each do |store|
  Branch.create!(store: store, location: Faker::Address.full_address,
                 open_time: Faker::Time.forward(days: 1, period: :morning), close_time: Faker::Time.forward(days: 1, period: :evening), open_weekends: Faker::Boolean.boolean, open_public_holidays: Faker::Boolean.boolean, open_24hrs: Faker::Boolean.boolean, open_24hrs_weekends: Faker::Boolean.boolean)
end

Branch.all.each do |branch|
  Staff.create!(user: User.where.not(id: sombo.id).sample, branch: branch, store_id: branch.store.id,
                date_joined: Faker::Date.backward(days: 14), date_left: Faker::Date.backward(days: 14), staff_type: Faker::Lorem.word, staff_category: Faker::Lorem.word, staff_sub_category: Faker::Lorem.word, staff_status: Faker::Lorem.word, staff_role: Faker::Lorem.word, staff_position: Faker::Lorem.word, staff_department: Faker::Lorem.word, staff_designation: Faker::Lorem.word)
end

Branch.all.each do |branch|
  StoreContact.create!(store_id: branch.store.id, branch: branch, contact_info: Faker::Lorem.paragraph)
end

Branch.all.each do |branch|
  Product.create!(store_id: branch.store.id, branch: branch, name: Faker::Lorem.word,
                  description: Faker::Lorem.paragraph, product_type: Faker::Lorem.word, product_category: Faker::Lorem.word, product_sub_category: Faker::Lorem.word, color: Faker::Color.color_name, size: Faker::Lorem.word, weight: Faker::Number.decimal(l_digits: 2), weight_unit: Faker::Lorem.word, dimension: Faker::Number.decimal(l_digits: 2), dimension_unit: Faker::Lorem.word, sku: Faker::Lorem.word, barcode: Faker::Lorem.word, manufacturer: Faker::Lorem.word, brand: Faker::Lorem.word, model: Faker::Lorem.word, origin: Faker::Lorem.word, condition: Faker::Lorem.word, condition_note: Faker::Lorem.paragraph, warranty: Faker::Boolean.boolean, warranty_period: Faker::Number.number(digits: 1), warranty_policy: Faker::Lorem.paragraph, return_policy: Faker::Lorem.paragraph, return_period: Faker::Number.number(digits: 1), price: Faker::Number.decimal(l_digits: 2), discount: Faker::Number.decimal(l_digits: 2), tax: Faker::Number.decimal(l_digits: 2), shipping_fee: Faker::Number.decimal(l_digits: 2), shipping_discount: Faker::Number.decimal(l_digits: 2), shipping_discount_price: Faker::Number.decimal(l_digits: 2), shipping_tax: Faker::Number.decimal(l_digits: 2), shipping_weight: Faker::Number.decimal(l_digits: 2), shipping_weight_unit: Faker::Lorem.word, shipping_dimension: Faker::Number.decimal(l_digits: 2), shipping_dimension_unit: Faker::Lorem.word, shipping_distance: Faker::Number.decimal(l_digits: 2), shipping_distance_unit: Faker::Lorem.word, shipping_duration: Faker::Number.decimal(l_digits: 2), featured: Faker::Boolean.boolean, best_seller: Faker::Boolean.boolean, new_arrival: Faker::Boolean.boolean, on_display: Faker::Boolean.boolean, on_sale: Faker::Boolean.boolean, on_auction: Faker::Boolean.boolean, on_rent: Faker::Boolean.boolean, on_demand: Faker::Boolean.boolean, on_pre_order: Faker::Boolean.boolean)
end

Product.all.each do |product|
  ProductVariant.create!(product: product, name: Faker::Lorem.word, description: Faker::Lorem.paragraph,
                         color: Faker::Color.color_name, size: Faker::Lorem.word, weight: Faker::Number.decimal(l_digits: 2), weight_unit: Faker::Lorem.word, dimension: Faker::Number.decimal(l_digits: 2), dimension_unit: Faker::Lorem.word, sku: Faker::Lorem.word, barcode: Faker::Lorem.word, manufacturer: Faker::Lorem.word, brand: Faker::Lorem.word, model: Faker::Lorem.word, origin: Faker::Lorem.word, condition: Faker::Lorem.word, condition_note: Faker::Lorem.paragraph, warranty: Faker::Boolean.boolean, warranty_period: Faker::Number.number(digits: 1), warranty_policy: Faker::Lorem.paragraph, return_policy: Faker::Lorem.paragraph, return_period: Faker::Number.number(digits: 1), price: Faker::Number.decimal(l_digits: 2), discount: Faker::Number.decimal(l_digits: 2), tax: Faker::Number.decimal(l_digits: 2), shipping_fee: Faker::Number.decimal(l_digits: 2), shipping_discount: Faker::Number.decimal(l_digits: 2), shipping_discount_price: Faker::Number.decimal(l_digits: 2), shipping_tax: Faker::Number.decimal(l_digits: 2), shipping_weight: Faker::Number.decimal(l_digits: 2), shipping_weight_unit: Faker::Lorem.word, shipping_dimension: Faker::Number.decimal(l_digits: 2), shipping_dimension_unit: Faker::Lorem.word, shipping_distance: Faker::Number.decimal(l_digits: 2), shipping_distance_unit: Faker::Lorem.word, shipping_duration: Faker::Number.decimal(l_digits: 2), featured: Faker::Boolean.boolean, best_seller: Faker::Boolean.boolean, new_arrival: Faker::Boolean.boolean, on_display: Faker::Boolean.boolean, on_sale: Faker::Boolean.boolean, on_auction: Faker::Boolean.boolean, on_rent: Faker::Boolean.boolean, on_demand: Faker::Boolean.boolean, on_pre_order: Faker::Boolean.boolean)
end

Branch.all.each do |branch|
  Service.create!(store_id: branch.store.id, branch: branch, name: Faker::Lorem.word,
                  description: Faker::Lorem.paragraph, service_type: Faker::Lorem.word, service_category: Faker::Lorem.word, service_sub_category: Faker::Lorem.word)
end

Service.all.each do |service|
  ServiceVariant.create!(service: service, name: Faker::Lorem.word, description: Faker::Lorem.paragraph)
end

ServiceProvider.all.each do |service_provider|
  OnDemandService.create!(service_provider: service_provider, name: Faker::Lorem.word,
                          description: Faker::Lorem.paragraph, service_type: Faker::Lorem.word, service_category: Faker::Lorem.word, service_sub_category: Faker::Lorem.word, duration: Faker::Number.decimal(l_digits: 2), duration_unit: Faker::Lorem.word, distance: Faker::Number.decimal(l_digits: 2), distance_unit: Faker::Lorem.word, price: Faker::Number.decimal(l_digits: 2), discount: Faker::Number.decimal(l_digits: 2), tax: Faker::Number.decimal(l_digits: 2), price_rate: Faker::Lorem.word, rating: Faker::Number.decimal(l_digits: 2), rating_count: Faker::Number.number(digits: 1), is_active: Faker::Boolean.boolean, is_deleted: Faker::Boolean.boolean, is_featured: Faker::Boolean.boolean, is_popular: Faker::Boolean.boolean, is_new: Faker::Boolean.boolean, is_recommended: Faker::Boolean.boolean, is_verified: Faker::Boolean.boolean, is_visible: Faker::Boolean.boolean, is_available: Faker::Boolean.boolean)
end

User.all.each do |user|
  Wallet.create!(user: user, currency: Faker::Currency.code,
                 amount: Faker::Number.decimal(l_digits: 2), conversion_rate: Faker::Number.decimal(l_digits: 2))
end

Wallet.all.each do |wallet|
  Transaction.create!(wallet: wallet, amount: Faker::Number.number(digits: 3),
                      fees: Faker::Number.number(digits: 3), conversion_rate: Faker::Number.decimal(l_digits: 2), details: Faker::Lorem.paragraph, transaction_type: Faker::Lorem.word, transaction_category: Faker::Lorem.word, transaction_sub_category: Faker::Lorem.word, transaction_status: Faker::Lorem.word, transaction_mode: Faker::Lorem.word, transaction_method: Faker::Lorem.word)
end

10.times do
  AcceptedCurrency.create!(code: Faker::Lorem.word, code_three: Faker::Lorem.word, country: Faker::Lorem.word,
                           name: Faker::Lorem.word, value_against_dollar: Faker::Number.decimal(l_digits: 2), conversion_rate: Faker::Number.decimal(l_digits: 2))
end

10.times do
  GovernmentFacility.create!(name: Faker::Lorem.word, facility_type: Faker::Lorem.word,
                             location: Faker::Address.full_address, address: Faker::Address.full_address, city: Faker::Address.city, state: Faker::Address.state, country: Faker::Address.country, pincode: Faker::Address.zip_code, phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, website: Faker::Internet.url, contact: Faker::Lorem.paragraph)
end

User.all.each do |user|
  Search.create!(term: Faker::Lorem.word, category: Faker::Lorem.word, user: user,
                 ip: Faker::Internet.ip_v4_address, location: Faker::Address.full_address, referer: Faker::Internet.url)
end
