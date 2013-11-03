require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VehiclesController do

  # This should return the minimal set of attributes required to create a valid
  # Vehicle. As you add validations to Vehicle, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "reg_no" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VehiclesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all vehicles as @vehicles" do
      vehicle = Vehicle.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vehicles).should eq([vehicle])
    end
  end

  describe "GET show" do
    it "assigns the requested vehicle as @vehicle" do
      vehicle = Vehicle.create! valid_attributes
      get :show, {:id => vehicle.to_param}, valid_session
      assigns(:vehicle).should eq(vehicle)
    end
  end

  describe "GET new" do
    it "assigns a new vehicle as @vehicle" do
      get :new, {}, valid_session
      assigns(:vehicle).should be_a_new(Vehicle)
    end
  end

  describe "GET edit" do
    it "assigns the requested vehicle as @vehicle" do
      vehicle = Vehicle.create! valid_attributes
      get :edit, {:id => vehicle.to_param}, valid_session
      assigns(:vehicle).should eq(vehicle)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vehicle" do
        expect {
          post :create, {:vehicle => valid_attributes}, valid_session
        }.to change(Vehicle, :count).by(1)
      end

      it "assigns a newly created vehicle as @vehicle" do
        post :create, {:vehicle => valid_attributes}, valid_session
        assigns(:vehicle).should be_a(Vehicle)
        assigns(:vehicle).should be_persisted
      end

      it "redirects to the created vehicle" do
        post :create, {:vehicle => valid_attributes}, valid_session
        response.should redirect_to(Vehicle.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vehicle as @vehicle" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vehicle.any_instance.stub(:save).and_return(false)
        post :create, {:vehicle => { "reg_no" => "invalid value" }}, valid_session
        assigns(:vehicle).should be_a_new(Vehicle)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vehicle.any_instance.stub(:save).and_return(false)
        post :create, {:vehicle => { "reg_no" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vehicle" do
        vehicle = Vehicle.create! valid_attributes
        # Assuming there are no other vehicles in the database, this
        # specifies that the Vehicle created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Vehicle.any_instance.should_receive(:update).with({ "reg_no" => "MyString" })
        put :update, {:id => vehicle.to_param, :vehicle => { "reg_no" => "MyString" }}, valid_session
      end

      it "assigns the requested vehicle as @vehicle" do
        vehicle = Vehicle.create! valid_attributes
        put :update, {:id => vehicle.to_param, :vehicle => valid_attributes}, valid_session
        assigns(:vehicle).should eq(vehicle)
      end

      it "redirects to the vehicle" do
        vehicle = Vehicle.create! valid_attributes
        put :update, {:id => vehicle.to_param, :vehicle => valid_attributes}, valid_session
        response.should redirect_to(vehicle)
      end
    end

    describe "with invalid params" do
      it "assigns the vehicle as @vehicle" do
        vehicle = Vehicle.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vehicle.any_instance.stub(:save).and_return(false)
        put :update, {:id => vehicle.to_param, :vehicle => { "reg_no" => "invalid value" }}, valid_session
        assigns(:vehicle).should eq(vehicle)
      end

      it "re-renders the 'edit' template" do
        vehicle = Vehicle.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vehicle.any_instance.stub(:save).and_return(false)
        put :update, {:id => vehicle.to_param, :vehicle => { "reg_no" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vehicle" do
      vehicle = Vehicle.create! valid_attributes
      expect {
        delete :destroy, {:id => vehicle.to_param}, valid_session
      }.to change(Vehicle, :count).by(-1)
    end

    it "redirects to the vehicles list" do
      vehicle = Vehicle.create! valid_attributes
      delete :destroy, {:id => vehicle.to_param}, valid_session
      response.should redirect_to(vehicles_url)
    end
  end

end
