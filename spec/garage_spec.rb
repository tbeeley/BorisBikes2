require 'garage'

describe Garage do

	let(:garage) 		{ Garage.new }

	it_behaves_like 'a bike container'

	it 'should have no bikes when created' do
		expect(garage.bike_count).to eq 0
	end

	it 'should fix all bikes' do
		broken_bike = double :bike, broken?: true
		expect(broken_bike).to receive(:fix!)
		garage.take_in(broken_bike)
	end

end
