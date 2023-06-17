# frozen_string_literal: true

json.extract! branch, :id, :store_id, :location, :created_at, :updated_at
json.url branch_url(branch, format: :json)
