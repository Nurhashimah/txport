class FuelIssuedsController < ApplicationController
  before_action :set_fuel_issued, only: [:show, :edit, :update, :destroy]

  # GET /fuel_issueds
  # GET /fuel_issueds.json
  def index
    @fuel_issueds = FuelIssued.all
  end

  # GET /fuel_issueds/1
  # GET /fuel_issueds/1.json
  def show
  end

  # GET /fuel_issueds/new
  def new
    @fuel_issued = FuelIssued.new
  end

  # GET /fuel_issueds/1/edit
  def edit
  end

  # POST /fuel_issueds
  # POST /fuel_issueds.json
  def create
    @fuel_issued = FuelIssued.new(fuel_issued_params)

    respond_to do |format|
      if @fuel_issued.save
        format.html { redirect_to @fuel_issued, notice: 'Fuel issued was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fuel_issued }
      else
        format.html { render action: 'new' }
        format.json { render json: @fuel_issued.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fuel_issueds/1
  # PATCH/PUT /fuel_issueds/1.json
  def update
    respond_to do |format|
      if @fuel_issued.update(fuel_issued_params)
        format.html { redirect_to @fuel_issued, notice: 'Fuel issued was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fuel_issued.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuel_issueds/1
  # DELETE /fuel_issueds/1.json
  def destroy
    @fuel_issued.destroy
    respond_to do |format|
      format.html { redirect_to fuel_issueds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuel_issued
      @fuel_issued = FuelIssued.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fuel_issued_params
      params.require(:fuel_issued).permit(:fuel_unit_id, :fuel_type_id, :description, :quantity)
    end
end
