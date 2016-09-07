module CleanData
  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_phone_number(phone_number)
    phone_number.gsub!(/[^0-9]/,"")
    phone_number.ljust(10 , "0")[0..9]
  end
end
