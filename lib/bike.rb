class Bike

	def initialize
		fix!
	end

	def broken?
		@broken
	end

	def break!
		@broken = true
		self
		#self is required in this case because otherwise the method would just return a boolean. Self returns the instance itself.
	end

	def fix!
		@broken = false
		self
	end

end
