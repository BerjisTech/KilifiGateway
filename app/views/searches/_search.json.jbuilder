# frozen_string_literal: true

json.extract! search, :id, :term, :category, :user_id, :ip, :location, :referer, :created_at, :updated_at
json.url search_url(search, format: :json)
