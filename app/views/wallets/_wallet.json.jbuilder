json.extract! wallet, :id, :user_id, :currency, :amount, :conversion_rate, :created_at, :updated_at
json.url wallet_url(wallet, format: :json)
