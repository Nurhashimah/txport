class Vehicle < ActiveRecord::Base
  validates_presence_of :reg_no
  validates_uniqueness_of :reg_no
  validates_uniqueness_of :chassis_no, :allow_nil => true, :allow_blank => true
  validates_uniqueness_of :engine_no, :allow_nil => true, :allow_blank => true
end