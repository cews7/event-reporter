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
end
