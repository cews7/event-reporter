require 'csv'

class Load

  attr_reader :contents

  def initialize(filename = "event_attendees.csv")
    @contents = CSV.open (filename), headers: true, header_converters: :symbols
  end
end
