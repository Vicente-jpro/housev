json.extract! plans_selected, :id, :day_used, :duration, :plans_id, :user_id, :created_at, :updated_at
json.url plans_selected_url(plans_selected, format: :json)
