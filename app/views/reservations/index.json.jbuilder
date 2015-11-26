json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :customer_id, :promotion_id
  json.url reservation_url(reservation, format: :json)
end
