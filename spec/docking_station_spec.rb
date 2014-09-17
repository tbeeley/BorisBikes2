require 'docking_station'

describe DockingStation do

	let(:station) { DockingStation.new  }
	let(:bike) 			  { Bike.new	}
	let(:broken_bike) { Bike.new.break! }

	it 'should not release a bike if broken' do
		station.accept(broken_bike)
		expect(lambda { station.release(broken_bike) }).to raise_error('This bike is broken')
	end

end
