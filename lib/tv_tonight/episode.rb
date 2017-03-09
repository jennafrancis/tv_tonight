class TvTonight::Episode
  attr_accessor :name, :series, :network, :description, :series_url, :time

  @@all = []

  def initialize
  end

  def self.all
    @@all
  end

  def self.scrape_episodes

    page = Nokogiri::HTML(open("http://www.tvguide.com/trending-tonight/"))
    binding.pry
    
    page.css(".listings-program-list").each do |show|
      episode = self.new
      episode.name = show.css("h4").text
      episode.series = show.css("h3").text
      airing = show.css(".listings-program-airing-info")
      info = airing.split(" | ")
        air_time = info[0]
        air_network = info[1]
      episode.time = air_time
      episode.network = air_network
      episode.description = show.css(".listings-program-description").text
      episode.url = show.css("a").attr("href").text
      @@all << episode
    end
  end

end
