require 'minitest/autorun'
require 'minitest/pride'
require './lib/load_csv'

class LoadTest < Minitest::Test
  def test_load_class_exists
    assert_instance_of Load, Load.new
  end

  def test_load_can_load_csv
    content = Load.new.contents

    assert_instance_of CSV, content
  end
end
