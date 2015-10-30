json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :title, :description, :banner_url, :date_of_creation, :end_date, :duration_flag, :quantity
  json.url promotion_url(promotion, format: :json)
end
