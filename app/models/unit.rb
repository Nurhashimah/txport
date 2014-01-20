class Unit < ActiveRecord::Base
  has_many :fuel_tanks, :foreign_key => "unit_id"
  has_many :subunits, class_name: "Unit", foreign_key: 'parent_id'
  belongs_to :parent, class_name: "Unit", foreign_key: 'parent_id'
  has_many :vehicle_cards, dependent: :nullify
  has_many :fuel_units
  has_many :depot_accounts, class_name: "FuelUnit" 
end
