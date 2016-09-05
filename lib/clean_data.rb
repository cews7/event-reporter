module CleanData
  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end
  def clean_phone_number(phone_number)
    phone_number.gsub!('(','')
    phone_number.gsub!(')','')
    phone_number.gsub!(' ','')
    phone_number.gsub!('-','')
    phone_number.gsub!('.','')
    if phone_number.length < 10
      puts "(don) tca llme"
    elsif phone_number.length == 11 && phone_number[0] == 1
      phone_number.reverse.chop.reverse
    elsif phone_number.length == 11 && phone_number[0] != 1
      puts "(don) tca llme"
    elsif phone_number.length > 11
      puts "(don) tca llme"
    end
    #catch the E+ 
  end

end
