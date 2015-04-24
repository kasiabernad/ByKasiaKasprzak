json.array!(@color_positions) do |color_position|
  json.extract! color_position, :id, :color_id, :position
  json.url color_position_url(color_position, format: :json)
end
