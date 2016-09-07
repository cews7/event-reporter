require './lib/clean_data'

class Attendees
  include CleanData
  attr_reader :id,
              :reg_date,
              :first_name,
              :last_name,
              :email,
              :phone,
              :street,
              :zip

  def initialize(attendee_hash)
    @id = attendee_hash[:id]
    @reg_date = attendee_hash[:reg_date]
    @first_name = attendee_hash[:first_name]
    @last_name = attendee_hash[:last_name]
    @email_address = attendee_hash[:email_address]
    @phone = clean_phone_number(attendee_hash[:homephone])
    @street = attendee_hash[:street]
    @city = attendee_hash[:city]
    @zip = clean_zipcode(attendee_hash[:zipcode])
  end
end
