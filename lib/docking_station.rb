class DockingStation

	def initialize
		@bikes = []
	end

	attr_accessor :bikes

	def bike_count
		@bikes.count
	end

end
