json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :active, :address, :city, :estate, :country, :zip_code, :latitude, :longitude, :type
  json.url user_url(user, format: :json)
end
