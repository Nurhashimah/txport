require 'spec_helper'

describe "fuel_supplieds/index" do
  before(:each) do
    assign(:fuel_supplieds, [
      stub_model(FuelSupplied,
        :depot_fuel_id => 1,
        :fuel_type_id => 2,
        :quantity => "9.99",
        :unit_type_id => 3
      ),
      stub_model(FuelSupplied,
        :depot_fuel_id => 1,
        :fuel_type_id => 2,
        :quantity => "9.99",
        :unit_type_id => 3
      )
    ])
  end

  it "renders a list of fuel_supplieds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
