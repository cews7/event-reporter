require './lib/load_csv'

class Commands

  attr_reader :queue

  def initialize
    @queue = []
  end

  #find method adds to queue
  def add_to_queue(something)
    @queue << something
  end

  #print method shifts first element in queue
  def print
    return @queue.shift 
  end

  def load_data
    loader = Load.new
    @attendees = loader
  end
  def find

  end



end
