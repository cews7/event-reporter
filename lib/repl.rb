require './lib/print_out_messages'
require './lib/commands'

class Repl
  include PrintOutMessages

  def run
    command_runner = Commands.new
    command_runner.load_data(filename)
    command = ""
    while command != "q"
      printf "Enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      case command
      when 'quit' then PrintOutMessages.goodbye
      when 'help' then puts PrintOutMessages.help
      when 'help ' #how are you going to make this not be a massive elsif?
        #when certainCommand
        #do somethign to attendees
      else
        puts "Sorry, I don't know how to #{command}"
      end
    end
  end
end

test = Repl.new
test.run
