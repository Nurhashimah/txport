class FuelUnitsController < ApplicationController
  before_action :set_fuel_unit, only: [:show, :edit, :update, :destroy]

  # GET /fuel_units
  # GET /fuel_units.json
  def index
    @fuel_units = FuelUnit.all
  end

  # GET /fuel_units/1
  # GET /fuel_units/1.json
  def show
  end

  # GET /fuel_units/new
  def new
    @fuel_unit = FuelUnit.new
    4.times do
      @fuel_unit.fuel_issueds.build
    end
    3.times do
      @fuel_unit.fuel_issueds.build
    end
  end

  # GET /fuel_units/1/edit
  def edit
  end

  # POST /fuel_units
  # POST /fuel_units.json
  def create
    @fuel_unit = FuelUnit.new(fuel_unit_params)

    respond_to do |format|
      if @fuel_unit.save
        format.html { redirect_to @fuel_unit, notice: (t 'fuel_units.title')+(t 'actions.created')  }
        format.json { render action: 'show', status: :created, location: @fuel_unit }
      else
        format.html { render action: 'new' }
        format.json { render json: @fuel_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fuel_units/1
  # PATCH/PUT /fuel_units/1.json
  def update
    respond_to do |format|
      if @fuel_unit.update(fuel_unit_params)
        format.html { redirect_to @fuel_unit, notice: (t 'fuel_units.title')+(t 'actions.updated')  }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fuel_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuel_units/1
  # DELETE /fuel_units/1.json
  def destroy
    @fuel_unit.destroy
    respond_to do |format|
      format.html { redirect_to fuel_units_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuel_unit
      @fuel_unit = FuelUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fuel_unit_params
      params.require(:fuel_unit).permit(:unit_id, :dept_account, :report_date, fuel_issueds_attributes: [:id, :fuel_unit_id, :fuel_type_id, :description, :quantity])
    end
end
