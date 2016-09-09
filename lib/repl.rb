require './lib/print_out_messages'
require './lib/message_handler'
require 'pry'
class Repl
  def run
    puts "Welcome to Event Reporter!"
    command = ""
    until command == "quit"
      printf "Enter command: "
      input = gets.chomp.split(" ")
      command = input[0]
      argument_1 = input[1]
      argument_2 = input[2]
      argument_3 = input[3]
      # binding.pry
      MessageHandler.delegate(command, argument_1, argument_2, argument_3)
    end
  end
end

test = Repl.new
test.run
