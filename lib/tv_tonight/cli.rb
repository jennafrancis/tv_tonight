class TvTonight::CLI

  def initialize
  end

  def call
    list_shows
    more_info
  end

  def list_shows
    puts "Top trending shows on tv tonight:"
    @shows = TvTonight::Episode.all
    @shows.each.with_index(1) {|show, index| puts "#{index}. #{show.series} - #{show.time} on #{show.network}"}
  end

  def more_info
    input = nil
    while input != "exit"#make this loop. give option to return to list, error message if not valid
      puts "Which show would you like to learn more about? Type list to return to the main list or exit to leave the program."
      input = gets.strip
      if input.to_i > 0
        selected =  @shows[input.to_i - 1]
        puts "#{selected.name} #{selected.time} etc."
        #return series, time, channel, episode, description, rating, etc. on article number which equals input
      elsif input.downcase == "list"
        list_shows
      else
        puts "Not sure what you meant. Please try again."
      end
    end #while
  end

end
