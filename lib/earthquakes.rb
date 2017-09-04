require 'net/http'
require 'json'

class Earthquakes
  DATA_URL = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson'.freeze

  class << self
    def run
      response_str = Net::HTTP.get(URI(DATA_URL))
      data = JSON.parse(response_str)
      features(data)
    end

    def features(geojson)
      geojson['features'].map { |x| x['properties'] }
    end
  end
end
