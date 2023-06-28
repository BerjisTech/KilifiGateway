# frozen_string_literal: true

json.extract! service_variant, :id, :service_id, :name, :description, :created_at, :updated_at
json.url service_variant_url(service_variant, format: :json)
