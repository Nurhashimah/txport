require 'spec_helper'

describe "VehicleCards" do
  describe "GET /vehicle_cards" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get vehicle_cards_path
      response.status.should be(200)
    end
  end
end
