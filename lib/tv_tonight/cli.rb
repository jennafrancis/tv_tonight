class TvTonight::CLI

  def call
    TvTonight::Episode.scrape_episodes
    list_shows
    more_info
    thanks
  end

  def list_shows
    puts "Top trending shows on TV Tonight:"
    puts "(As reported by TVGuide.com)"
    @shows = TvTonight::Episode.all
    @shows.each.with_index(1) {|show, index| puts "#{index}. #{show.series} - #{show.time} on #{show.network}"}
  end

  def more_info
    input = nil

    while input != "exit"#make this loop. give option to return to list, error message if not valid
      puts "Which show would you like more info about? Type list to return to the main list or exit to leave the program."
      input = gets.strip

      if input.to_i.between?(1,25)
        selected =  @shows[input.to_i - 1]
        puts "#{selected.series} - #{selected.name}"
        puts "#{selected.time} on #{selected.network}"
        puts "#{selected.description}"
        puts "For Cast, News, Photos and more about #{selected.series}, go to #{selected.url}."
        #return series, time, channel, episode, description, rating, etc. on article number which equals input
      elsif input.downcase == "list"
        list_shows
      else
        puts "Not sure what you meant. Please try again."
      end
    end #while
    
  end

  def thanks
    puts "Thanks for checking what's trending on TV Tonight. Happy Watching!"
  end

end
