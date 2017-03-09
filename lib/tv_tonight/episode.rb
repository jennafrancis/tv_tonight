class TvTonight::Episode
  attr_accessor :name, :series, :network, :description, :url, :time

  @@all = []

  def initialize
  end

  def self.all
    TvTonight::Episode.scrape_episodes
    @@all
  end

  def self.scrape_episodes

    page = Nokogiri::HTML(open("http://www.tvguide.com/trending-tonight/"))

    page.css(".listings-program").each do |show|
      episode = TvTonight::Episode.new
      episode.name = show.css("h4").text
      episode.series = show.css("h3").text
      # binding.pry
      airing = show.css(".listings-program-airing-info").text
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
