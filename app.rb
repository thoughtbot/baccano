require "bundler"
Bundler.require
$LOAD_PATH.unshift File.expand_path(File.join("..", "lib"), __FILE__)
require "yaml"
require "digest"
require "rng"

class App < Sinatra::Base
  get '/' do
    redirect "/#{SecureRandom.uuid}"
  end

  get '/random' do
    generator = Rng.new
    @avatar = generator.avatar

    content_type 'image/svg+xml'
    erb :index
  end

  get '/:seed' do
    generator = Rng.new Digest::MD5.hexdigest(params[:seed]).to_i(16)
    @avatar = generator.avatar

    content_type 'image/svg+xml'
    erb :index
  end
end
