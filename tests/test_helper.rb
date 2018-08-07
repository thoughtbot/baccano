ENV["RACK_ENV"] = "test"

require 'simplecov'
SimpleCov.start do
  add_filter %r{^/tests/}
end

require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

$LOAD_PATH.unshift File.expand_path(File.join("..", ".."), __FILE__)
$LOAD_PATH.unshift File.expand_path(File.join("..", "..", "lib"), __FILE__)
