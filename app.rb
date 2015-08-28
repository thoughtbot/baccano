Bundler.require
require 'yaml'

class App < Sinatra::Base
  get '/' do
    @body_color = fillify(rgbify(generate_random_color))
    @skin_color = fillify(rgbify(random_skin_tone))
    erb :index
  end

  private

  def random_skin_tone
    skin_tones = YAML.load_file('skin_tones.yml')["skin_tones"]
    skin_tones.sample.join(', ')
  end

  def generate_random_color
    red_range = 0...255
    blue_range = 0...255
    green_range = 0...255

    [red_range, blue_range, green_range].map do |color_range|
      color_range.to_a.sample
    end.join(', ')
  end

  def rgbify(val)
    'rgb(' + val + ')'
  end

  def fillify(val)
    'fill="' + val + '"'
  end
end
