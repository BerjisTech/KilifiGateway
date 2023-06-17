# frozen_string_literal: true

json.array! @service_variants, partial: 'service_variants/service_variant', as: :service_variant
