require 'csv'
require 'pry'
require './lib/attendees'
require './lib/clean_data'
class Load
include CleanData
  attr_reader :attendees

  def initialize(filename = "event_attendees.csv")
    @contents = CSV.open filename, :headers => true, :header_converters => :symbol
    @attendees = @contents.map { |person|  Attendees.new(person)}
    binding.pry
  end
end

# if $0 == __FILE__
#   test = Load.new
#   return test
# end
