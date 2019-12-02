json.extract! offer, :id, :description, :name, :end_date, :price, :created_at, :updated_at
json.url offer_url(offer, format: :json)
