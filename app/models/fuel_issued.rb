class FuelIssued < ActiveRecord::Base
  belongs_to :fuel_unit, foreign_key: "fuel_unit_id"
end
