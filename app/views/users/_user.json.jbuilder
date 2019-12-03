json.extract! user, :id, :first_name, :last_name, :phone, :address, :is_admin, :is_pro, :stripe_customer_id, :stripe_session_id, :created_at, :updated_at
json.url user_url(user, format: :json)
