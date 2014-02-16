class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.search(params[:search]).order('reg_no')
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: (t 'vehicles.title')+(t 'actions.created') }
        format.json { render action: 'show', status: :created, location: @vehicle }
      else
        format.html { render action: 'new' }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: (t 'vehicles.title')+(t 'actions.updated')  }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url }
      format.json { head :no_content }
    end
  end

  def vehicle_daily_report  
    sdate = Date.today
     @vehicle_daily = Vehicle.where( "acquired_on = ? ", sdate ) 
  end

  def vehicle_monthly_report  
        c = Date.today
    sdate = c.beginning_of_month
    edate = c.end_of_month
     @vehicle_monthly = Vehicle.where( "acquired_on >= ? AND acquired_on <= ? ", sdate, edate )
  end

  def vehicle_yearly_report  
    c = Date.today
    sdate = c.beginning_of_year
    edate = c.end_of_year
     @vehicle_yearly = Vehicle.where( "acquired_on >= ? AND acquired_on <= ? ", sdate, edate ) 
  end

  def import_excel
  end
  
  def import
      #use this line or line 88-89
      #Vehicle.import(params[:file]) 
      #redirect_to vehicles_url, notice: (t 'vehicles.imported') 
      
      #OR use these lines onwards
      @vehicles = Vehicle.import(params[:file]) 
      if @vehicles.all?(&:valid?)
        @vehicles.each(&:save!)
        respond_to do |format|
          flash[:notice] 
          format.html { redirect_to vehicles_url, notice: (t 'vehicles.imported') }
        end
      else
        @invalid_vehicles = Vehicle.get_invalid(@vehicles) 
        respond_to do |format|
          flash[:notice] = (t 'vehicles.invalid_excel')+@invalid_vehicles.count.to_s+" "+(t 'vehicles.errors_count')  #yellow box
          format.html { render action: 'import_excel' }
          flash.discard
        end
      end
  end
  
  def download_excel_format
    send_file ("#{::Rails.root.to_s}/public/excel_format/vehicle_excel.xls")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:reg_no, :chassis_no, :engine_no, :reg_on, :manufacturer_year, :manufacturer_id,
                                      :model, :category_id, :acquired_on, :price, :contract_id, :status_id, :photo)
    end
end
