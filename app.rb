Bundler.require
require 'yaml'
require 'digest'
require_relative 'rng'

class App < Sinatra::Base
  get '/' do
    redirect "/#{SecureRandom.uuid}"
  end

  get '/random' do
    generator = Rng.new
    @avatar = generator.avatar

    erb :index
  end

  get '/:seed' do
    generator = Rng.new Digest::MD5.hexdigest(params[:seed]).to_i(16)
    @avatar = generator.avatar

    erb :index
  end
end
