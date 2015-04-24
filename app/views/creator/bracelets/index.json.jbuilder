json.array!(@bracelets) do |bracelet|
  json.extract! bracelet, :id, :clasp, :casp, :color_position_id, :row_number_id, :price
  json.url bracelet_url(bracelet, format: :json)
end
