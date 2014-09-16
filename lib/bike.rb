class Bike

	def initialize(broken = false)
		@broken = broken
	end

	attr_accessor :broken

	def broken?
		@broken
	end

	def break!
		@broken = true
	end

	def fix!
		@broken = false
	end

end
