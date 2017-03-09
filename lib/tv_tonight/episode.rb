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

  def scrape_episodes
    # page = Nokogiri::HTML(open(http://www.tvguide.com/trending-tonight))
    page.css("listing-programs-list").each do |show|
    end
  end

end
