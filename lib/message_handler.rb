require './lib/Load'
require './lib/print_out_messages'
require 'pry'
class MessageHandler
  # What SHOULD delegate do?
  #  - First layer of decision
  #  - Don't return
  #  - Will ultimatily print something
  def self.delegate(command, argument_1, argument_2 = nil, argument_3= nil)
    # binding.pry
    case command
    when 'load'  then @attendeesrepo = Load.new.attendeesrepo
      # binding.pry
    when 'quit'  then quit
    when 'help'  then PrintOutMessages.help
    when 'find'  then find(argument_1, argument_2)
    when 'queue' then print
    end
  end


#Find should return
  def self.find(attribute, criteria)
    @attendeesrepo.select do |attendee|
      if attendee.send("#{attribute}").upcase.include?(criteria.upcase)
        @queue << attendee
      end
    end
    return @queue
  end

#quit should print the message "goodbye" and exit the program
  def self.quit
    PrintOutMessages.goodbye
    sleep(1)
    exit
  end

  def help(argument)

    case argument
    when "print" then PrintOutMessages.print
    end
    # What is help() SUPPOSED to do?
    #  - serve as a source of delegation
    #  - print the help string if found
    #  - OR print a string telling us the thing wasn't found
    # What type SHOULD argument be?
    # If user type: help help
    # 'argument' should be: ["help"]
    def self.print
      command = argument[0]
      if argument.length == 1
        modifier = argument[1]
      else
        modifier = argument[1..2]
      end
      modifier = argument[1...2]
      case command
      when nil then PrintOutMessages.help
      when "find" then PrintOutMessages.help_find_filename

        # when "queue" then queue_delegator(modifier)
      else
        PrintOutMessages.no_method_that_is_in_spec(modifiers.first)
      end
    end
    #what does method do? what does
    # Method name tells me nothign abuot 'attribute' or `criteria`
    # If you hit annoying bug
    #   1. loog at method name
    #   2. am I doing what method name SAYS I should be doing?
    #   3. look at arguments?
    #      - am I treating the arguments appropriately given their name?
    #      - am I trying to treat an array of strings as a  string?
    #      - am I trying to treat a number as a string?
    #      - am I treating a string as an array?
    #      - maybe revisit argument name (command vs. list_of_commands, count vs. count_as_string)
    #   4. look as where the method is being called? is it being called correctly given its (obvious) name

    def count
      @queue.length
    end

    def clear
      @queue.clear
    end

    def print
      puts "LAST NAME".ljust(12, " ") + "FIRST NAME".ljust(15, " ") + "EMAIL".ljust(35, " ") + "ZIPCODE".ljust(10, " ") + "CITY".ljust(20, " ") +
      "STATE".ljust(10, " ") + "ADDRESS".ljust(30, " ") + "PHONE".ljust(20, " ") + "DISTRICT".ljust(20, " ")
      "\n"
      puts "#{attendee.last_name.ljust(12, " ")}#{attendee.first_name.ljust(15, " ")} #{attendee.email_address.ljust(35, " ")} #{attendee.zipcode.ljust(10, " ")}#{attendee.city.ljust(20, " ")}#{attendee.state.ljust(10, " ")}#{attendee.street.ljust(30, " ")}#{attendee.home_phone.ljust(20, " ")}#{attendee.zipcode.ljust(20, " ")}"
    end

    def print_by
      puts "LAST NAME".ljust(12, " ") + "FIRST NAME".ljust(15, " ") + "EMAIL".ljust(35, " ") + "ZIPCODE".ljust(10, " ") + "CITY".ljust(20, " ") +
      "STATE".ljust(10, " ") + "ADDRESS".ljust(30, " ") + "PHONE".ljust(20, " ") + "DISTRICT".ljust(20, " ")

      @queue.each do |attendee|
        puts "#{attendee.last_name.ljust(12, " ")}#{attendee.first_name.ljust(15, " ")} #{attendee.email_address.ljust(35, " ")} #{attendee.zipcode.ljust(10, " ")}#{attendee.city.ljust(20, " ")}#{attendee.state.ljust(10, " ")}#{attendee.street.ljust(30, " ")}#{attendee.home_phone.ljust(20, " ")}#{attendee.zipcode.ljust(20, " ")}"
      end
    end
  end

  # def self.queue_delegator(modifier)
  #
  #
  # end
  #
  # def self.find(...)
  # end
  #
  # def self.queue(...)
  # end
end
