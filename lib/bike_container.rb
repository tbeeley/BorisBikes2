module BikeContainer

	DEFAULT_CAPACITY = 20

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def bike_count
		bikes.count
	end

	def accept(bike)
		raise 'This container is full' if full?
		@bikes << bike
	end

	def full?
		bike_count == capacity
	end

	def empty?
		bike_count == 0
	end

	def available_bikes
		bikes.delete_if { |bike| bike.broken? }
		bikes.count
	end

	def release(bike)
		raise 'There are no available bikes' if empty?
		@bikes.delete(bike)
	end

end
