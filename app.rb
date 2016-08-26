Bundler.require
require 'yaml'

require_relative './color_generator'

class App < Sinatra::Base
  get '/' do
   redirect "/#{rand(10000)}"
  end

  get '/:seed' do
    srand params[:seed].to_i
    @body_color = fillify(rgbify(generate_random_color))
    @skin_color = fillify(rgbify(random_skin_tone))
    @glasses = random_attribute_partial("glasses")

    erb :index
  end

  private

  def random_attribute_partial(name)
    Dir.glob("./views/partials/#{name}/*.erb").map do |path|
      path.gsub("./views/", "").gsub(".erb", "").to_sym
    end.sample
  end

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
