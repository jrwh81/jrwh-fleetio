module Fleetio
  class FuelEntryLookup
    def self.find_fuel_entries(vehicle) 
      self.new(vehicle).find_fuel_entries 
    end

    def initialize(vehicle) 
      @vehicle = vehicle
    end

    def find_fuel_entries 
       Fleetio::FuelEntry.get(@vehicle.id)
    end
  end
end