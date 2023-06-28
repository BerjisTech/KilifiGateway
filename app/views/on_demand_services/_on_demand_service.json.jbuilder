# frozen_string_literal: true

json.extract! on_demand_service, :id, :service_provider_id, :name, :description, :service_type, :service_category,
              :service_sub_category, :duration, :duration_unit, :distance, :distance_unit, :price, :discount, :tax, :created_at, :updated_at
json.url on_demand_service_url(on_demand_service, format: :json)
