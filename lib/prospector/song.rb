class Prospector::Song

		attr_accessor :name, :position, :artist, :last_week, :peak, :weeks_on, :url

		@@all = []

		def self.find_by_index(indx)
			self.all[indx]
		end

		def initialize(url=nil, name=nil, artist=nil, position=nil, last_week=nil, peak=nil, weeks_on=nil)
			@url = url
			@name = name
			@artist = artist
			@position = position
			@last_week = last_week
			@peak = peak
			@weeks_on = weeks_on
			@@all << self
		end

		def self.all
			@@all
		end
end
