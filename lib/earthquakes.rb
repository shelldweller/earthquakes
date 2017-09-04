require 'net/http'
require 'json'

class Earthquakes
  DATA_URL = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson'.freeze

  class << self
    def run
      response_str = Net::HTTP.get(URI(DATA_URL))
      JSON.parse(response_str)
    end
  end
end
