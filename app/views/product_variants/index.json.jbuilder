# frozen_string_literal: true

json.array! @product_variants, partial: 'product_variants/product_variant', as: :product_variant
