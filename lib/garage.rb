require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(capacity = 20)
		@bikes = []
		@capacity = capacity
	end

	attr_accessor :bikes, :capacity

	# def take_in(bike)
	# 	raise 'This Garage is full' if full?
	# 	bike.fix!
	# 	@bikes << bike
	# end

	def fix_all_bikes
		broken_bikes.each {|bike| bike.fix!}
	end

end
