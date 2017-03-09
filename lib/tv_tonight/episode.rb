class TvTonight::Episode
  attr_accessor :title, :series, :channel, :description, :series_url, :time

  @@all = []

  def initialize
  end

  def self.all
    @@all
  end

  def scrape_episodes
    # page = Nokogiri::HTML(open(http://www.tvguide.com/trending-tonight))
    page.css("listing-programs-list").each do |show|
    end
  end

end
