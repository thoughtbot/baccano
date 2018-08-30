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

  get '/*' do
    @avatar = generator.avatar

    content_type 'image/svg+xml'
    erb :index
  end

  private

  def generator
    Rng.new(digested_seed_value)
  end

  def digested_seed_value
    Digest::MD5.hexdigest(seed_value).to_i(16)
  end

  def seed_value
    params[:splat].to_s
  end
end
