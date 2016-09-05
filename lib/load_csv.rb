require 'csv'

class Load
include CleanData
  attr_reader :contents

  def initialize(filename = "event_attendees.csv")
    @contents = CSV.new (filename, :headers => true,
                                   :header_converters => :symbols
                                   :converts => :all)
  end
end
