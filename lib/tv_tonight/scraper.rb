class TvTonight::Scraper


  def self.scrape_episodes

    page = Nokogiri::HTML(open("http://www.tvguide.com/trending-tonight/"))

    page.css(".listings-program").each do |show|

      name = show.css("h4 .listings-program-link").text.strip
      series = show.css("h3").text.strip
      airing = show.css(".listings-program-airing-info").text
      info = airing.split(" | ")
        air_time = info[0]
        air_network = info[1]
      time = air_time
      network = air_network
      description = show.css(".listings-program-description").text.strip
      url = show.css("a").attr("href").text
      TvTonight::Episode.new(name, series, network, description, url, time)
      
    end
  end


end
