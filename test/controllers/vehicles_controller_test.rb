require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get vehicles_url, as: :json
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post vehicles_url, params: { vehicle: { color: @vehicle.color, current_meter_value: @vehicle.current_meter_value, license_plate: @vehicle.license_plate, make: @vehicle.make, model: @vehicle.model, name: @vehicle.name, vin: @vehicle.vin, year: @vehicle.year } }, as: :json
    end

    assert_response 201
  end

  # test "should search fleetio api for vehicle, create new vehicle from api" do
  #   get find_by_vin_url(vin: "123")

  #   assert_redirected_to(:controller => "vehicles", :action => "create")
  # end

  test "should search fleetio api for vehicle, return vehicle if already exists" do
    get find_by_vin_url(vin: "MyString")
    result_vehicle = JSON.parse(response.body.to_s)
    
    assert_equal(result_vehicle["vin"], @vehicle["vin"])
    assert_response :found
  end


  test "should show vehicle" do
    get vehicle_url(@vehicle), as: :json
    assert_response :success
  end

  test "should update vehicle" do
    patch vehicle_url(@vehicle), params: { vehicle: { color: @vehicle.color, current_meter_value: @vehicle.current_meter_value, license_plate: @vehicle.license_plate, make: @vehicle.make, model: @vehicle.model, name: @vehicle.name, vin: @vehicle.vin, year: @vehicle.year } }, as: :json
    assert_response 200
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete vehicle_url(@vehicle), as: :json
    end

    assert_response 204
  end
end
