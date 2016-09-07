require 'csv'
require 'pry'
require './lib/attendees'
require './lib/clean_data'
class LoadAndExecute
  include CleanData
  attr_reader :attendeesrepo, :contents, :queue

  def initialize(filename = "event_attendees.csv")
    @contents = CSV.readlines filename, :headers => true, :header_converters => :symbol
    @attendeesrepo = @contents.map { |person| Attendees.new(person) }
    @queue = []
  end

  def find(attribute, criteria)
    @attendeesrepo.select do |attendee|
      if attendee.send("#{attribute}").upcase.include?(criteria.upcase)
        @queue << attendee
      end
    end
  end
  #print method shifts first element in queue
  def print
    @queue.shift
  end

  def load_data
    loader = Load.new
    @attendees = loader
  end
end
