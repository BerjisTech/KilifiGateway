# frozen_string_literal: true

json.extract! government_facility, :id, :name, :type, :location, :created_at, :updated_at
json.url government_facility_url(government_facility, format: :json)
