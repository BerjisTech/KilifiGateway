# frozen_string_literal: true

json.extract! service, :id, :store_id, :branch_id, :name, :description, :service_type, :service_category, :sku,
:condition, :condition_note, :warranty, :warranty_period, :warranty_policy, :return_policy, :return_period, :price, 
:discount, :tax, :featured, :best_seller, :new_arrival, :on_display, :on_sale,
:on_demand, :service_sub_category, :created_at, :updated_at
json.url service_url(service, format: :json)
