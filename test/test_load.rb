require 'minitest/autorun'
require 'pride'


class LoadTest < Minitest::Test
  def test_load_class_exists

    assert_instance_of Load, Load.new
  end

  def test_load_can_load_csv
    contents = Load.new

    assert_instance_of CSV::Table, contents
  end
end
