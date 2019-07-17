class VehiclesController < ApiController
  #before_action :set_vehicle, only: [:show, :update, :destroy]

  # GET /vehicles
  def index
    @vehicles = Vehicle.all

    render json: @vehicles
  end

  # GET /vehicles/1
  def show
    render json: @vehicle
  end

  def find
    existing_vehicle = Vehicle.find_by_vin(params[:vin])
    api_vehicle = Fleetio::Vehicle.find(params[:vin])

    if existing_vehicle.present?
      render json: { message: "Vehicle is Already Saved!",
                     vehicles: Vehicle.all, status: :found }
    elsif api_vehicle.blank?
      render json: { message: "Vehicle with vin #{params[:vin]} could not be found",
                     vehicles: Vehicle.all }
    else
      vehicle = Vehicle.create!(api_vehicle)
      ::FuelEntryLookupJob.perform_later(vehicle)
      render json: { message: "Vehicle Created!",
                     vehicles: Vehicle.all }
    end
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      render json: { message: "Vehicle was successfully added!",
                     vehicles: Vehicle.all, status: :created }
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vehicle_params
      params.require(:vehicle).permit(:color, :make, :model, :year, :name, :license_plate, :current_meter_value, :vin)
    end
end
