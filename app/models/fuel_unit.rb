class FuelUnit < ActiveRecord::Base
  belongs_to :fuel_receiver, class_name: "Unit", foreign_key: "unit_id"
  belongs_to :depot_account, class_name: "Unit", foreign_key: "dept_account"
  has_many :fuel_issueds, dependent: :destroy 
  accepts_nested_attributes_for :fuel_issueds, allow_destroy: true, reject_if: proc { |fuel_issueds| fuel_issueds[:fuel_type_id].blank? }
  
end
