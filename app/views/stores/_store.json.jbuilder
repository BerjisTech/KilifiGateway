json.extract! store, :id, :owner_id, :name, :description, :location, :open_time, :close_time, :open_weekends, :open_public_holidays, :open_24hrs, :open_24hrs_weekends, :created_at, :updated_at
json.url store_url(store, format: :json)
