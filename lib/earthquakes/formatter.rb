require 'colorize'

module Earthquakes
  module Formatter
    COLOR_MAP = {
      minor: :light_black,
      light: :white,
      moderate: :blue,
      strong: :yellow,
      major: :red,
      great: :red
    }.freeze

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
