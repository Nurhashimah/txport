class CreateFuelUnits < ActiveRecord::Migration
  def change
    create_table :fuel_units do |t|
      t.integer :unit_id
      t.integer :dept_account
      t.date :report_date

      t.timestamps
    end
  end
end
