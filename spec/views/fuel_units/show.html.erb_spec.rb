require 'spec_helper'

describe "fuel_units/show" do
  before(:each) do
    @fuel_unit = assign(:fuel_unit, stub_model(FuelUnit,
      :unit_id => 1,
      :dept_account => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
