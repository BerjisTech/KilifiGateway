# frozen_string_literal: true

json.extract! branch, :id, :store_id, :location, :open_time, :close_time, :open_weekends, :open_public_holidays,
              :open_24hrs, :open_24hrs_weekends, :created_at, :updated_at
json.url branch_url(branch, format: :json)
