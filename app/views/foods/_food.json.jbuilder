json.extract! food, :id, :name, :order_id, :cost, :created_at, :updated_at
json.url food_url(food, format: :json)
