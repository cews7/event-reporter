require './lib/load_csv'

class Commands
  def load_data
    loader = Load.new
    @attendees = loader
end
