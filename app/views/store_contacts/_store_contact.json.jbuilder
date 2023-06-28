# frozen_string_literal: true

json.extract! store_contact, :id, :store_id, :branch_id, :contact_info, :created_at, :updated_at
json.url store_contact_url(store_contact, format: :json)
