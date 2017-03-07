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
    input = nil
    while input != "exit"#make this loop. give option to return to list, error message if not valid
      puts "Which show would you like to learn more about? Type list to return to the main list or exit to leave the program."
      input = gets.strip
      if input.to_i.between?(1,10)
        puts "more tv show info"
        #return series, time, channel, episode, description, rating, etc. on article number which equals input
      else
        puts "Not sure what you meant. Please try again."
      end
    end #while
  end

end
