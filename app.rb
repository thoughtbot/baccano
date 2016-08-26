Bundler.require
require 'yaml'
require 'color/rgb/contrast'

class App < Sinatra::Base
  get '/' do
   redirect "/#{rand(10000)}"
  end

  get '/:seed' do
    srand params[:seed].to_i(36)
    primary_color = generate_random_color
    background_color = random_different_color(primary_color)
    @body_color = fillify(primary_color.css_rgba)
    @body_highlight_color = fillify(primary_color.lighten_by(70).css_rgba)
    @background_color = fillify(background_color.css_rgba)
    @background_shadow_color = fillify(background_color.darken_by(70).css_rgba)
    @skin_color = fillify(random_skin_tone.css_rgba)
    @glasses = percentage(60, "") { random_attribute_partial("glasses") }

    erb :index
  end

  private

  def percentage(odds, default)
    if (0...100).to_a.sample < odds
      default
    else
      yield
    end
  end

  def random_attribute_partial(name)
    Dir.glob("./views/partials/#{name}/*.erb").map do |path|
      path.gsub("./views/", "").gsub(".erb", "").to_sym
    end.sample
  end

  def random_different_color(color)
    attempt = generate_random_color
    require 'color/rgb/contrast'
    if color.contrast(attempt) > 0.3
       attempt
    else
      random_different_color(color)
    end
  end

  def random_skin_tone
    red, green, blue = YAML.load_file('skin_tones.yml')["skin_tones"].sample
    Color::RGB.new(red, green, blue)
  end

 def generate_random_color
    random_red = (0...255).to_a.sample
    random_green = (0...255).to_a.sample
    random_blue = (0...255).to_a.sample

    Color::RGB.new(random_red, random_green, random_blue)
  end

  def fillify(val)
    'fill="' + val + '"'
  end
end
