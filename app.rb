Bundler.require
require 'yaml'

require_relative './color_generator'

class App < Sinatra::Base
  get '/' do
    generator = ColorGenerator.new

    @body_color = present(generator.body_color)
    @body_detail_color = present(generator.body_detail_color)
    @skin_color = present(random_skin_tone)

    erb :index
  end

  private

  def random_skin_tone
    skin_tones = YAML.load_file('skin_tones.yml')["skin_tones"]
    skin_tones.sample.join(', ')
  end

  def present(color)
    fillify(rgbify(color))
  end

  def rgbify(val)
    'rgb(' + val + ')'
  end

  def fillify(val)
    'fill="' + val + '"'
  end
end
