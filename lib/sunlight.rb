require './lib/load'
# require 'congress'
class Sunlight

  def initialize
    @client = Congress::Client.new("43e0b18e571447ecba2bb84b44dd4209")
  end

  def return_district(zipcode)
    @client.districts_locate(zipcode).to_hash["results"][0]["district"].to_s
  end

  def district_info(zipcode)
    url = "http://congress.api.sunlightfoundation.com/districts/locate?zip=#{zipcode}&apikey=43e0b18e571447ecba2bb84b44dd4209"
    data = JSON.parse(open(url).read)
    district_number = data["results"][0]["district"]
  end

  def queue_district
    i = 0
    if @load.queue.count < 10
      @load.queue.each do |attendee|
        zipcode = @load.queue[i]["zipcode"]
        district_number = district_info(zipcode)
        @load.queue[i].merge!("district" => district_number)
        i += 1
      end
      @load.queue
    else puts "Too many entries"
    end
  end
end
