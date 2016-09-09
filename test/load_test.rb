require 'minitest/autorun'
require 'minitest/pride'
require './lib/load_csv'

class LoadTest < Minitest::Test
  def test_load_class_exists
    assert_instance_of Load, Load.new
  end
end
