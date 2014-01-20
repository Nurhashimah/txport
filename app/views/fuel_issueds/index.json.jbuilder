json.array!(@fuel_issueds) do |fuel_issued|
  json.extract! fuel_issued, :fuel_unit_id, :fuel_type_id, :description, :quantity
  json.url fuel_issued_url(fuel_issued, format: :json)
end
