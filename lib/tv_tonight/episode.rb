class Episode
  attr_accessor :title, :series, :channel, :description, :series_url, :time

  @@all = []

  def initialize
  end
  
  def self.all
    @@all
  end

end
