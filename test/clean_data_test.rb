require 'minitest/autorun'
require 'minitest/pride'
require './lib/clean_data'

class CleanDataTest < Minitest::Test
  def test_valid_phone_number
    clean_phone_number()
  end
end
