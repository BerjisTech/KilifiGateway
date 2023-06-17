# frozen_string_literal: true

json.extract! transaction, :id, :wallet_id, :amount, :fees, :conversion_rate, :details, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
