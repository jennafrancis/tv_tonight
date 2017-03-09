class TvTonight::Episode
  attr_accessor :name, :series, :network, :description, :series_url, :time

  @@all = []

  def initialize
  end

  def self.all
    show_1 = self.new
    show_1.name = "Supernatural"
    show_1.time = "8:00 PM"
    show_1.network = "NBC"

    show_2 = self.new
    show_2.name = "SYTYCD"
    show_2.time = "9:00 PM"
    show_2.network = "CBS"

    [show_1,show_2]
  end

  def self.scrape_episodes
    # episodes = []

    page = Nokogiri::HTML(open("http://www.tvguide.com/trending-tonight/"))
    binding.pry
    
    page.css(".listings-program-list").each do |show|
      episode = {}
      episode[:name] = show.css("h4").text
      episode[:series] = show.css("h3").text
      airing = show.css(".listings-program-airing-info")
      info = airing.split(" | ")
        air_time = info[0]
        air_network = info[1]
      episode[:time] = air_time
      episode[:network] = air_network
      episode[:description] = show.css(".listings-program-description").text
      episode[:url] = show.css("a").attr("href").text
      episodes << episode
    end
    episodes
  end

end
