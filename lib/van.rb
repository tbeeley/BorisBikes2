class Van

	include BikeContainer

	def initialize(capacity = 20)
		@bikes = []
		@capacity = capacity
	end

	attr_accessor :bikes, :capacity

	def collect_bikes_from(station)
		station.broken_bikes.each {|bike| accept(station.release(bike))}
	end

	def deposit_bikes_at(garage)
		broken_bikes.each {|bike| garage.accept(release(bike))}
	end

end
