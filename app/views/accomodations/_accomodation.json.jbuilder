# frozen_string_literal: true

json.extract! accomodation, :id, :owner_id, :description, :bathrooms, :bedrooms, :balcony, :location, :name, :price,
              :rating, :latitude, :longitude, :amenities, :currency, :max_guests, :min_stay, :max_stay, :guests_included, :extra_guest_fee, :cleaning_fee, :security_deposit, :service_fee, :host_fee, :cancellation_policy, :cancellation_days, :cancellation_penalty, :cancellation_rate, :created_at, :updated_at
json.url accomodation_url(accomodation, format: :json)
