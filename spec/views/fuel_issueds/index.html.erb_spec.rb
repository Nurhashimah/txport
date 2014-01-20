require 'spec_helper'

describe "fuel_issueds/index" do
  before(:each) do
    assign(:fuel_issueds, [
      stub_model(FuelIssued,
        :fuel_unit_id => 1,
        :fuel_type_id => 2,
        :description => "Description",
        :quantity => "9.99"
      ),
      stub_model(FuelIssued,
        :fuel_unit_id => 1,
        :fuel_type_id => 2,
        :description => "Description",
        :quantity => "9.99"
      )
    ])
  end

  it "renders a list of fuel_issueds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
