require './lib/load'
require './lib/sunlight'
require './lib/print_out_messages'
require 'pry'
class MessageHandler

  # What SHOULD delegate do?
  #  - First layer of decision
  #  - Don't return
  #  - Will ultimatily print something
  def self.delegate(command, argument_1 = nil, argument_2 = nil, argument_3= nil)
    case command
    when 'load'  then @load = Load.new
    when 'quit'  then quit
    when 'help'  then help(command, argument_1, argument_2)
    when 'find'  then find(argument_1, argument_2)
    when 'queue' then branch(argument_1)
    else
      puts "Sorry, I don't know the command: #{command}"
    end
  end

  def self.branch(argument_1)
    if argument_1 == 'clear'
      clear
    elsif argument_1 == 'count'
      count
    elsif argument_1 == 'print'
      print
    elsif argument_1 == 'print_by'
      print_by
    elsif argument_1 == 'district'
      @sunlight = Sunlight.new
      @sunlight.queue_district
    elsif argument_1 == 'save to'
      save_to("exported_csv.csv")
    end
  end

  def self.find(attribute, criteria)
    clear
    @load.attendeesrepo.select do |attendee|
      if attendee.send("#{attribute}").upcase.include?(criteria.upcase)
        @load.queue << attendee
      end
    end
  end

  # def save_to(filename)
  #   csv_file = CSV.new filename, 'w' :write_headers => true
  #   csv_file << ["LAST NAME","FIRST NAME","EMAIL","ZIPCODE","CITY","STATE","ADDRESS","PHONE"]
  #   csv_file << @load.queue
  # end

  def self.quit
    PrintOutMessages.goodbye
    sleep(1)
    exit
  end

  # What is help() SUPPOSED to do?
  #  - serve as a source of delegation
  #  - print the help string if found
  #  - OR print a string telling us the thing wasn't found
  # What type SHOULD argument be?
  # If user type: help help
  # 'argument' should be: ["help"]
  def self.help(command, argument_1 = nil, argument_2 = nil, argument_3 = nil)
    PrintOutMessages.help if command == 'help' && argument_1.nil?

    #definitely break these case statments into different methods
    case argument_1 #second command
    when 'find' then PrintOutMessages.help_find_filename
    when 'load' then PrintOutMessages.help_load_filename
    when 'clear' then PrintOutMessages.help_clear_queue
    when 'help' then PrintOutMessages.help_help
    when 'queue' then PrintOutMessages.help_queue_save_to
    end

    case argument_2 #third input
    when 'print' then PrintOutMessages.help_queue_print
    when 'count' then PrintOutMessages.help_queue_count
    end

    case argument_3 #fourth input
    when 'by' then PrintOutMessages.help_queue_print_by_attribute
    when 'to' then PrintOutMessages.help_queue_save_to
    end
  end

  def self.count
    puts @load.queue.length
  end

  def self.clear
    @load.queue.clear
  end

  def self.print
    puts "LAST NAME".ljust(12, " ") + "FIRST NAME".ljust(15, " ") + "EMAIL".ljust(35, " ") + "ZIPCODE".ljust(10, " ") + "CITY".ljust(20, " ") +
    "STATE".ljust(10, " ") + "ADDRESS".ljust(30, " ") + "PHONE".ljust(20, " ") + "DISTRICT".ljust(20, " ")
    "\n"
    @load.queue.each do |attendee|
      puts "#{attendee.last_name.ljust(12, " ")}#{attendee.first_name.ljust(15, " ")} #{attendee.email_address.ljust(35, " ")} #{attendee.zipcode.ljust(10, " ")}#{attendee.city.ljust(20, " ")}#{attendee.state.ljust(10, " ")}#{attendee.street.ljust(30, " ")}#{attendee.home_phone.ljust(20, " ")}#{attendee.zipcode.ljust(20, " ")}"
    end
  end
end
