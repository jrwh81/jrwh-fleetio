require 'faraday'
require 'json'

module Fleetio
  class Connection
    BASE = 'https://secure.fleetio.com/api/v1'

    def self.api
      Faraday.new(url: BASE) do |faraday|
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
        faraday.headers['Content-Type'] = 'application/json'
        faraday.headers['Authorization'] = ENV['AUTH']
        faraday.headers['Account-Token'] = ENV['TOKEN']
      end
    end
  end
end