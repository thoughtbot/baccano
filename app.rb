Bundler.require

class App < Sinatra::Base
  get '/' do
    @bg_color = generate_background_color
    erb :index
  end

  private

  def generate_background_color
    red_range = 0...255
    blue_range = 0...255
    green_range = 0...255

    [red_range, blue_range, green_range].map do |color_range|
      color_range.to_a.sample
    end.join(', ')
  end
end
