Bundler.require
require 'yaml'
require 'digest'
require 'color/rgb/contrast'
require_relative 'rng'

class App < Sinatra::Base
  get '/' do
    redirect "/#{SecureRandom.uuid}"
  end

  get '/:seed' do
    generator = Rng.new Digest::MD5.hexdigest(params[:seed]).to_i(16)
    @avatar = generator.avatar

    erb :index
  end
end
