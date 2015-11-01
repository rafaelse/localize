json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :title, :description, :banner, :date_of_creation, :end_date, :quantity, :category
  json.url promotion_url(promotion, format: :json)
end
