require 'spec_helper'

describe "fuel_units/edit" do
  before(:each) do
    @fuel_unit = assign(:fuel_unit, stub_model(FuelUnit,
      :unit_id => 1,
      :dept_account => 1
    ))
  end

  it "renders the edit fuel_unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fuel_unit_path(@fuel_unit), "post" do
      assert_select "input#fuel_unit_unit_id[name=?]", "fuel_unit[unit_id]"
      assert_select "input#fuel_unit_dept_account[name=?]", "fuel_unit[dept_account]"
    end
  end
end
