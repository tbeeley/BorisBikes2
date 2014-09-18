require 'garage'

describe Garage do

	let(:garage) 		{ Garage.new }
	let(:broken_bike)	{ double :bike, broken?: true }

	it_behaves_like 'a bike container'

	it 'should have no bikes when created' do
		expect(garage.bike_count).to eq 0
	end

	it 'should fix all bikes' do
		garage.bikes = [broken_bike]
		expect(broken_bike).to receive(:fix!)
		garage.fix_all_bikes
	end

end
