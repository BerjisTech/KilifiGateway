json.extract! product, :id, :store_id, :branch_id, :name, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
