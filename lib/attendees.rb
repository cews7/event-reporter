require './lib/clean_data'
  attr_reader :first_name, :phone, :zip

class Attendees
  include CleanData


  def initialize(attendee_hash)
    @first_name = attendee_hash[:first_name]
    #
    #
    #
    @phone = clean_phone_number(attendee_hash[:homephone])
    @zip = clean_zipcode(attendee_hash[:zipcode])
  end

end
# def clean_zip(zip_code)
#  # do the things to clean a zip code
# end
#
# def clean_phone(phone)
#   # do the things
# end
