class Bike

	def initialize
		# @broken = broken
		self.fix!
	end

	attr_accessor :broken

	def broken?
		@broken
	end

	def break!
		@broken = true
		self
	end

	def fix!
		@broken = false
		self
	end

end
