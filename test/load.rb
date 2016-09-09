require 'minitest/autorun'
require 'minitest/pride'
require './lib/load_csv'

class LoadTest < Minitest::Test
  def test_load_class_exists
    assert_instance_of Load, LoadAndExecute.new
  end

  def test_find_method
    sample = LoadAndExecute.new

    assert_equal 1, sample.find("first_name", "Allison").count
  end

  def test_command_works
  end
end
