json.extract! plan, :id, :name_plans, :price, :description, :activated, :first_time, :created_at, :updated_at
json.url plan_url(plan, format: :json)
