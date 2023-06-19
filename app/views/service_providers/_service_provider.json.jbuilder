json.extract! service_provider, :id, :user_id, :email, :phone_number, :email_verified, :phone_number_verified, :available, :online, :average_rating, :number_of_ratings, :currency, :bio, :location, :jobs_done, :total_earnings, :created_at, :updated_at
json.url service_provider_url(service_provider, format: :json)
