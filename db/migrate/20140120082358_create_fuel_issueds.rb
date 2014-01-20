class CreateFuelIssueds < ActiveRecord::Migration
  def change
    create_table :fuel_issueds do |t|
      t.integer :fuel_unit_id
      t.integer :fuel_type_id
      t.string :description
      t.decimal :quantity

      t.timestamps
    end
  end
end
