require 'docking_station'

describe DockingStation do

	let(:station) { DockingStation.new  }

	it_behaves_like 'a bike container'

	it 'should not release a bike if broken' do
		broken_bike = double :bike, broken?: true
		station.accept(broken_bike)
		expect(lambda { station.release(broken_bike) }).to raise_error('This bike is broken')
	end

end
