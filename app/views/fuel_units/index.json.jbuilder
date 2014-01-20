json.array!(@fuel_units) do |fuel_unit|
  json.extract! fuel_unit, :unit_id, :dept_account, :report_date
  json.url fuel_unit_url(fuel_unit, format: :json)
end
