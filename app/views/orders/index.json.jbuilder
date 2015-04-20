json.array!(@orders) do |order|
  json.extract! order, :id, :bracelet_id, :price
  json.url order_url(order, format: :json)
end
