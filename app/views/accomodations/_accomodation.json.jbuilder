# frozen_string_literal: true

json.extract! accomodation, :id, :owner_id, :description, :bathrooms, :bedrooms, :balcony, :location, :created_at,
              :updated_at
json.url accomodation_url(accomodation, format: :json)
