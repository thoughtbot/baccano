ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'

require File.expand_path '../app.rb', __FILE__

class SmokeTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    App
  end

  def test_no_smoking
    get '/'
    assert_equal 200, last_response.status
  end
end
