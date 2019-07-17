module Fleetio
  class FuelEntry < Base
    attr_accessor :total_miles,
                  :total_gallons

    def initialize(args = {})
      super(args)
    end

    def self.get(vehicle_id)
      response = Request.get("vehicles/#{vehicle_id}/fuel_entries")
    end   
  end
end