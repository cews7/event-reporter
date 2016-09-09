require 'minitest/autorun'
require 'minitest/pride'
require './lib/repl'

class ReplTest < MiniTest::Test

  def test_repl_works
    test = Repl.new
    test.run

    assert_equal "goodbye" && exit, 'quit'
  end

  

end
