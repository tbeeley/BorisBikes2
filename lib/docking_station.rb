require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(capacity = 20)
		@bikes = []
		@capacity = capacity
	end

	attr_accessor :capacity

end
