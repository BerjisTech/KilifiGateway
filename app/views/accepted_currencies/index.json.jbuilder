# frozen_string_literal: true

json.array! @accepted_currencies, partial: 'accepted_currencies/accepted_currency', as: :accepted_currency
