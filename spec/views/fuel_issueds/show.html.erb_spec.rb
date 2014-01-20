require 'spec_helper'

describe "fuel_issueds/show" do
  before(:each) do
    @fuel_issued = assign(:fuel_issued, stub_model(FuelIssued,
      :fuel_unit_id => 1,
      :fuel_type_id => 2,
      :description => "Description",
      :quantity => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Description/)
    rendered.should match(/9.99/)
  end
end
