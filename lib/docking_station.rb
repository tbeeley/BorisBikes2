class DockingStation

	def initialize(capacity = 20)
		@bikes = []
		@capacity = capacity
	end

	attr_accessor :bikes, :capacity

	def bike_count
		@bikes.count
	end

	def accept(bike)
		raise 'This station is full' if full?
		@bikes << bike
	end

	def release(bike)
		raise 'There are no available bikes' if empty?
		raise 'This bike is broken' if bike.broken?
		@bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end

	def empty?
		bike_count == 0
	end

end
