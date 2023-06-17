# frozen_string_literal: true

json.extract! staff, :id, :user_id, :branch_id, :created_at, :updated_at
json.url staff_url(staff, format: :json)
