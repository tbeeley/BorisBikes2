require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(capacity = 20)
		@bikes = []
		@capacity = capacity
	end

	attr_accessor :bikes, :capacity

	def release(bike)
		raise 'There are no available bikes' if empty?
		raise 'This bike is broken' if bike.broken?
		@bikes.delete(bike)
	end

end
