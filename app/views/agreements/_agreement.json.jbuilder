json.extract! agreement, :id, :from, :to, :payment_date, :rent, :deposit, :property_id, :tenant_id, :created_at, :updated_at
json.url agreement_url(agreement, format: :json)
