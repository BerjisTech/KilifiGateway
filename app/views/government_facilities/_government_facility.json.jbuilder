# frozen_string_literal: true

json.extract! government_facility, :id, :name, :facility_type, :location, :address, :city, :state, :country, :pincode,
              :phone, :email, :website, :contact, :created_at, :updated_at
json.url government_facility_url(government_facility, format: :json)
