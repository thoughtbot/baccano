ENV["RACK_ENV"] = "test"
require "minitest/autorun"

$LOAD_PATH.unshift File.expand_path(File.join("..", ".."), __FILE__)
$LOAD_PATH.unshift File.expand_path(File.join("..", "..", "lib"), __FILE__)
