class TvTonight::CLI


  def initialize
  end

  def call
    list_shows
    more_info
  end

  def list_shows
    puts "Top trending shows on tv tonight:"
    #lists top 10 shows with series, time, and channel
  end

  def more_info
    puts "Which show would you like to learn more about?"
    input = gets.strip
    #returns series, time, channel, episode, description, rating, etc.
  end
end
