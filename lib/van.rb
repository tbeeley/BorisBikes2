require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(capacity = 20)
		@bikes = []
		@capacity = capacity
	end

	attr_accessor :bikes, :capacity

	def take_bike_from(container, bike)
		accept(container.release(bike))
	end

	def collect_broken_bikes_from(station)
		station.broken_bikes.each {|bike| take_bike_from(station, bike)}
	end

	def collect_fixed_bikes_from(garage)
		garage.working_bikes.each {|bike| take_bike_from(garage, bike)}
	end

	def give_bike_to(container, bike)
		container.accept(release(bike))
	end

	def deposit_bikes_at(garage)
		broken_bikes.each {|bike| give_bike_to(garage, bike) }
		garage.fix_all_bikes
	end


	def deposit_fixed_bikes_at(docking_station)
		working_bikes.each {|bike| give_bike_to(docking_station, bike) }
	end

end
