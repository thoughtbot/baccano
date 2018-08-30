require_relative "./test_helper"
require "app"

class SmokeTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    App
  end

  def test_random
    get "/random"
    assert_equal 200, last_response.status
  end

  def test_random_changes_response
    Random.stub :new_seed, 123 do
      get "/random"
    end
    first_svg = last_response.body

    Random.stub :new_seed, 456 do
      get "/random"
    end
    second_svg = last_response.body

    assert first_svg != second_svg
  end

  def test_root
    get "/"
    assert_equal 302, last_response.status
  end

  def test_seed
    get "/Hodor"
    assert_equal 200, last_response.status
  end

  def test_nested_seed
    get "/emails/user@example.com"
    assert_equal 200, last_response.status
  end
end
