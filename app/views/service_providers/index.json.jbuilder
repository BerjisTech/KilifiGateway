# frozen_string_literal: true

json.array! @service_providers, partial: 'service_providers/service_provider', as: :service_provider
