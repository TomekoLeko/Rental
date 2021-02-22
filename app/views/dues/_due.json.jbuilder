json.extract! due, :id, :type_id, :rent_id, :property_id, :tenant_id, :period_from, :period_to, :amount, :paid_amount, :paid_on, :payment_date, :created_at, :updated_at
json.url due_url(due, format: :json)
