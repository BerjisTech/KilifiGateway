# frozen_string_literal: true

json.array! @government_facilities, partial: 'government_facilities/government_facility', as: :government_facility
