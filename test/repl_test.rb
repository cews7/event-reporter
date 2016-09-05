require 'minitest/autorun'
require 'minitest/pride'
require './lib/repl'

class ReplTest < MiniTest::Test

  def test_quit_returns_goodbye
    @repl = Repl.new
    @repl.run

    assert_equal "goodbye" && exit, 'quit'
  end

end
