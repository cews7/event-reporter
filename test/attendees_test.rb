require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendees'
require 'pry'


class AttendeesTest < Minitest::Test
  def test_attendees_class_exists
    sample = Attendees.new(person)

    assert_instance_of Anttendees, sample
  end
end
