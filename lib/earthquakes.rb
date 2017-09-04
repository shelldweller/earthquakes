require 'colorize'
require 'net/http'
require 'json'

class Earthquakes
  DATA_URL = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson'.freeze
  COLOR_MAP = {
    minor: :light_black,
    light: :white,
    moderate: :blue,
    strong: :yellow,
    major: :red,
    great: :red
  }.freeze

  class << self
    def run
      response_str = Net::HTTP.get(URI(DATA_URL))
      data = JSON.parse(response_str)
      features(data).map { |x| earthquake_info(x) }
    end

    def features(geojson)
      geojson['features'].map { |x| x['properties'] }
    end

    def magnitude_to_sym(magnitude)
      return :minor if magnitude < 4
      return :light if magnitude < 5
      return :moderate if magnitude < 6
      return :strong if magnitude < 7
      return :major if magnitude < 8
      :great
    end

    def earthquake_info(properties)
      color = COLOR_MAP[magnitude_to_sym(properties['mag'])]
      properties['title'].colorize(color)
    end
  end
end
