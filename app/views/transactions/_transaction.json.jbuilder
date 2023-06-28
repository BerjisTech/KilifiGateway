# frozen_string_literal: true

json.extract! transaction, :id, :wallet_id, :amount, :fees, :conversion_rate, :details, :transaction_type,
              :transaction_category, :transaction_sub_category, :transaction_status, :transaction_mode, :transaction_method, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
