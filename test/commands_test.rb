require 'minitest/autorun'
require 'minitest/pride'
require './lib/commands'
require 'pry'

class CommandsTest < Minitest::Test
  def does_commands_class_exist
    sample = Commands.new
    assert_instance_of Commands, sample
  end

  def test_queue_can_take_one_item
    sample = Commands.new
    sample.add_to_queue(1)
    
    assert_equal [1], sample.queue
  end
end
