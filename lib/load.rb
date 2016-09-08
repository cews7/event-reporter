require 'csv'
require 'pry'
require './lib/attendees'
require './lib/clean_data'

class Load
  include CleanData
  attr_reader :attendeesrepo, :contents, :queue

  def initialize(filename = "event_attendees.csv")
    @contents = CSV.readlines filename, :headers => true, :header_converters => :symbol
    @attendeesrepo = @contents.map { |person| Attendees.new(person) }
    @queue = []
  end
end
# def find(attribute, criteria)
#   @attendeesrepo.select do |attendee|
#     if attendee.send("#{attribute}").upcase.include?(criteria.upcase)
#       @queue << attendee
#     end
#   end
# end
#
# def count
#   @queue.count
# end
#
# def clear
#   @queue.clear
# end
#
# def print
#   puts "LAST NAME".ljust(12, " ") + "FIRST NAME".ljust(15, " ") + "EMAIL".ljust(35, " ") + "ZIPCODE".ljust(10, " ") + "CITY".ljust(20, " ") +
#   "STATE".ljust(10, " ") + "ADDRESS".ljust(30, " ") + "PHONE".ljust(20, " ") + "DISTRICT".ljust(20, " ")
#   "\n"
#   puts "#{attendee.last_name.ljust(12, " ")}#{attendee.first_name.ljust(15, " ")} #{attendee.email_address.ljust(35, " ")} #{attendee.zipcode.ljust(10, " ")}#{attendee.city.ljust(20, " ")}#{attendee.state.ljust(10, " ")}#{attendee.street.ljust(30, " ")} #{attendee.home_phone.ljust(20, " ")}#{attendee.zipcode.ljust(20, " ")}"
# end
#
# def print_by
#   puts "LAST NAME".ljust(12, " ") + "FIRST NAME".ljust(15, " ") + "EMAIL".ljust(35, " ") + "ZIPCODE".ljust(10, " ") + "CITY".ljust(20, " ") +
#   "STATE".ljust(10, " ") + "ADDRESS".ljust(30, " ") + "PHONE".ljust(20, " ") + "DISTRICT".ljust(20, " ")
#
#   @queue.each do |attendee|
#     puts "#{attendee.last_name.ljust(12, " ")}#{attendee.first_name.ljust(15, " ")} #{attendee.email_address.ljust(35, " ")} #{attendee.zipcode.ljust(10, " ")}#{attendee.city.ljust(20, " ")}#{attendee.state.ljust(10, " ")}#{attendee.street.ljust(30, " ")} #{attendee.home_phone.ljust(20, " ")}#{attendee.zipcode.ljust(20, " ")}"
#   end
# end
