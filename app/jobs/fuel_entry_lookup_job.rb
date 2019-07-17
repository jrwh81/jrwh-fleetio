class FuelEntryLookupJob < ActiveJob::Base
  queue_as :default

  def perform(vehicle)
    Fleetio::FuelEntryLookup.find_fuel_entries(vehicle) 
  end 
end