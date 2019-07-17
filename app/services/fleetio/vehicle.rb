module Fleetio
  class Vehicle < Base
    attr_accessor :color,
                  :make,
                  :model,
                  :year,
                  :name,
                  :license_plate,
                  :current_meter_value,
                  :vin

    def initialize(args = {})
      super(args)
    end

    def self.find(vin)
      response = Request.get("vehicles?q[vin_eq]=#{vin}")
      response_hash = response[0].to_h
      scoped_response = response_hash.slice("color", "make", "model", "year", "name",
                                            "license_plate", "current_meter_value", "vin",
                                            "group_name", "vehicle_status_color",
                                            "registration_state", "vehicle_status_name",
                                            "default_image_url_medium",
                                            "default_image_url_large")
    end   
  end
end