require 'minitest/autorun'
require 'minitest/pride'
require './lib/message_handler'
require './lib/load'

class MessageHandlerTest < Minitest::Test
  def test_can_print_to_terminal
    sample = MessageHandler.new

    sample.find("first_name", "Chris")
  end

  # def test_
  # end
end
