json.extract! land, :id, :title_land, :photo, :description, :price, :dimention_id, :address_id, :created_at, :updated_at
json.url land_url(land, format: :json)
json.photo url_for(land.photo)
