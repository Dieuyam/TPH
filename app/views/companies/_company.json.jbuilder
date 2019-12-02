json.extract! company, :id, :name, :siret, :address, :created_at, :updated_at
json.url company_url(company, format: :json)
