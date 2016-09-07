require './lib/print_out_messages'
require './lib/commands'

class Repl
  include PrintOutMessages

  def run
    # command_runner = Commands.new
    # command_runner.load_data(filename)
    command = ""
    while command != "q"
      printf "Enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts.join(" ")
      case command
      when 'quit' then PrintOutMessages.goodbye
      when 'help' then puts PrintOutMessages.help
      when 'help find' then PrintOutMessages.help_find_filename
      when 'help load' then PrintOutMessages.help_load_filename
      when 'help queue count' then PrintOutMessages.help_queue_count
      when 'help clear' then PrintOutMessages.help_clear_queue
      when 'help help' then PrintOutMessages.help_help
      when 'help queue print' then PrintOutMessages.help_queue_print
      when 'help queue print by' then PrintOutMessages.help_queue_print_by_attribute
      when 'help queue save to' then PrintOutMessages.help_queue_save_to
        #Follow above format for doing all the help commands "stock phrases"
        #
        #
        #
        #when certainCommand
        #do somethign to attendees
      when 'queue count'
      else
        puts "Sorry, I don't know how to #{command}"
      end
    end
  end
end

test = Repl.new
test.run
