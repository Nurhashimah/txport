require 'spec_helper'

describe "fuel_units/index" do
  before(:each) do
    assign(:fuel_units, [
      stub_model(FuelUnit,
        :unit_id => 1,
        :dept_account => 2
      ),
      stub_model(FuelUnit,
        :unit_id => 1,
        :dept_account => 2
      )
    ])
  end

  it "renders a list of fuel_units" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
