json.extract! service, :id, :store_id, :branch_id, :name, :description, :service_type, :service_category, :service_sub_category, :created_at, :updated_at
json.url service_url(service, format: :json)
