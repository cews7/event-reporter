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
      MessageHandler.delegate(command, argument_1, argument_2)
    end
  end
end
# while command != "q"
#
#   input = gets.chomp
#   parts = input.split(" ")
#   command = parts.join(" ")
#   case command
#   when 'quit' then PrintOutMessages.goodbye
#   when 'help' then puts PrintOutMessages.help
#   when 'help find' then PrintOutMessages.help_find_filename
#   when 'help load' then PrintOutMessages.help_load_filename
#   when 'help queue count' then PrintOutMessages.help_queue_count
#   when 'help clear' then PrintOutMessages.help_clear_queue
#   when 'help help' then PrintOutMessages.help_help
#   when 'help queue print' then PrintOutMessages.help_queue_print
#   when 'help queue print by' then PrintOutMessages.help_queue_print_by_attribute
#   when 'help queue save to' then PrintOutMessages.help_queue_save_to
#   when 'find argument '

#setup
#a) define command (ex: "quit", "help", "find", "queue")
#b) define arguments (ex: "find", "load, "queue count", attributes...)
#1. have one help statement what has access to all other help statesments
#a. break apart case statement
#2. be able to type find ... ... pull the find method
#when certainCommand
#do somethign to attendees
# when 'queue count'

test = Repl.new
test.run
