json.array!(@row_numbers) do |row_number|
  json.extract! row_number, :id, :row_number
  json.url row_number_url(row_number, format: :json)
end
