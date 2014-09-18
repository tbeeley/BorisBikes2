module BikeContainer

	DEFAULT_CAPACITY = 20

	def bikes
		@bikes ||= []
		#These are accessor methods. Modules cannot be instantiated, so these are necessary.
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
		# The ||= symbol just signifies that it will default to DEFAULT_CAPACITY if @capacity is nil. It means @capacity = @capacity || DEFAULT_CAPACITY
	end

	def bike_count
		bikes.count
		#can't access bikes.count because it's a module
	end

	def full?
		bike_count == capacity
	end

	def empty?
		bike_count == 0
	end

	def accept(bike)
		raise 'That aint no bike' if (!bike.instance_of?(Bike))
		raise 'This container is full' if full?
		@bikes << bike
	end

	def release(bike)
		raise "We can't give you what you're asking for" if (!bikes.include?(bike))
		@bikes.delete(bike)
	end

	def broken_bikes
		bikes.delete_if { |bike| !bike.broken? }
	end

	def working_bikes
		sort_broken_bikes
	end

	def available_bikes
		sort_broken_bikes
		bike_count
	end

	def sort_broken_bikes
		bikes.delete_if { |bike| bike.broken? }
	end
end
