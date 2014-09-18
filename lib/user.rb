class User

	def initialize(name)
		@name = name
		@bikes = []
		@capacity = 1
	end

	attr_accessor :name, :bikes, :capacity

	def rent(bike)
		raise "Whoops, that doesn't seem to be a bike" if (!bike.instance_of?(Bike))
		raise 'You can only rent one bike at a time' if full?
		raise 'Unfortunately, that bike is broken' if bike.broken?
		@bikes << bike
	end

	def full?
		bikes.count == capacity
	end

end
