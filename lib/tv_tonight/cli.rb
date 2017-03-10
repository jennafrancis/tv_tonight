class TvTonight::CLI

  def call
    TvTonight::Episode.scrape_episodes
    list_shows
    more_info
    thanks
  end

  def list_shows
    puts "Top trending shows on TV Tonight:"
    puts Time.now
    puts "(As reported by TVGuide.com)"
    @shows = TvTonight::Episode.all
    @shows.each.with_index(1) {|show, index| puts "#{index}. #{show.series} - #{show.time} on #{show.network}"}
    puts " "
  end

  def more_info
    input = nil

    while input != "exit"
      puts "Which show would you like more info about? Type list to return to the main list or exit to leave the program."
      input = gets.strip

      if input.to_i>0
        selected =  @shows[input.to_i - 1]
        if selected == nil
          puts "Not sure what you meant. Please try again."
        else
          puts " "
          puts "#{selected.series} - #{selected.name}"
          puts "#{selected.time} on #{selected.network}"
          puts "#{selected.description}"
          puts "For Cast, News, Photos and more about #{selected.series}, go to #{selected.url}."
          puts " "
        end
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
