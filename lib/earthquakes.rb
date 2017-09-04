require 'net/http'

class Earthquakes
  DATA_URL = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson'.freeze

  class << self
    def run
      data = Net::HTTP.get(URI(DATA_URL))
      puts(data)
    end
  end
end
