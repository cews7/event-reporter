require './lib/print_out_messages'
class Repl
  include PrintOutMessages

  def run
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

      else
        puts "Sorry, I don't know how to #{command}"
      end
    end
  end
end
