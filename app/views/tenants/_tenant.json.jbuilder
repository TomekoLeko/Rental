json.extract! tenant, :id, :email, :name, :phone, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
