json.array!(@buildings) do |building|
  json.extract! building, :id, :building_name, :building_address, :favorite_type, :description
  json.url building_url(building, format: :json)
end
