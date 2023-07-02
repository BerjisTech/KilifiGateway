# frozen_string_literal: true

json.extract! product_variant, :id, :product_id, :name, :descritpion, :variant_type, :price, :discount, :variant_select_choices, :best_seller, :on_demand, :on_sale, :created_at, :updated_at
json.url product_variant_url(product_variant, format: :json)
