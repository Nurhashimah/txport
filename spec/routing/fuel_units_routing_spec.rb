require "spec_helper"

describe FuelUnitsController do
  describe "routing" do

    it "routes to #index" do
      get("/fuel_units").should route_to("fuel_units#index")
    end

    it "routes to #new" do
      get("/fuel_units/new").should route_to("fuel_units#new")
    end

    it "routes to #show" do
      get("/fuel_units/1").should route_to("fuel_units#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fuel_units/1/edit").should route_to("fuel_units#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fuel_units").should route_to("fuel_units#create")
    end

    it "routes to #update" do
      put("/fuel_units/1").should route_to("fuel_units#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fuel_units/1").should route_to("fuel_units#destroy", :id => "1")
    end

  end
end
