require 'spec_helper'

describe "fuel_units/new" do
  before(:each) do
    assign(:fuel_unit, stub_model(FuelUnit,
      :unit_id => 1,
      :dept_account => 1
    ).as_new_record)
  end

  it "renders new fuel_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fuel_units_path, "post" do
      assert_select "input#fuel_unit_unit_id[name=?]", "fuel_unit[unit_id]"
      assert_select "input#fuel_unit_dept_account[name=?]", "fuel_unit[dept_account]"
    end
  end
end
