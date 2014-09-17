class Garage

	include BikeContainer

	def initialize(capacity = 20)
		@bikes = []
		@capacity = capacity
	end

	attr_accessor :bikes, :capacity

	def take_in(bike)
		raise 'This Garage is full' if full?
		bike.fix!
		@bikes << bike
	end

end
