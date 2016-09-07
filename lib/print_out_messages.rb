module PrintOutMessages
  def self.help
    "     |===============================|
    | load <filename>               |
    | help                          |
    | help <command>                |
    | queue count                   |
    | queue clear                   |
    | queue print                   |
    | queue print by <attribute>    |
    | queue save to <filename.csv>  |
    | find <attribute> <criteria>   |
    |===============================|"
  end

  def self.goodbye
    puts "goodbye"
    sleep(2)
    exit
  end

  def self.help_load_filename
    puts "Erase any loaded data and parse the specified file.\nIf no filename is given, default to event_attendees.csv."
  end

  def self.help_help
    puts "Output a listing of the available individual commands"
  end

  def self.help_queue_count
    puts "Output how many records are in the current queue"
  end

  def self.help_queue_print
    puts "Print out a tab-delimited data table with a header row following this format:\n
    LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE"
  end

  def self.help_print_by_attribute
    puts "Print the data table sorted by the specified attribute like zipcode."
  end

  def self.help_queue_save_to
    puts "Export the current queue to the specified filename as a CSV. The file should should include data and headers for last name, first name, email, zipcode, city, state, address, and phone number."
  end

  def self.help_find_filename
    puts "Load the queue with all records matching the criteria for the given attribute. Example usages:\n
     *find zipcode 20011\n
     *find last_name Johnson\n
     *find state VA"
  end

  def self.queue_clear
    puts "Empty the queue"
  end
  #put all help command methods here
end
