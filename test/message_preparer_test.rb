require 'minitest/autorun'
require 'minitest/pride'
require 'message_preparer'

class MessagePreparerTest < minitest:Test
  assert_equal, "Sorry i dont know that command", MessagePreparer.delegate("quit", nil)
end
