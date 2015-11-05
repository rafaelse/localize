json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :title, :description, :banner, :valid_from, :valid_to, :quantity, :price, :category
  json.url promotion_url(promotion, format: :json)
end
