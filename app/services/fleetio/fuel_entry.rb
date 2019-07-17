module Fleetio
  class FuelEntry < Base
    attr_accessor :total_miles,
                  :total_gallons

    def initialize(args = {})
      super(args)
    end

    def self.get(vehicle_id)
      response = Fleetio::Request.get("vehicles/#{vehicle_id}/fuel_entries")
      response_hash = response[0].to_h
      scoped_response = response_hash.slice("color")
    end   
  end
end