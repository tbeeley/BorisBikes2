require 'garage'

describe Garage do

	let(:garage) 		{ Garage.new }
	let(:bike) 			{ Bike.new}
	let(:broken_bike) 	{ Bike.new.break!}

	it 'should have no bikes when created' do
		expect(garage.bike_count).to eq 0
	end

	it 'should fix all bikes' do
		garage.accept(bike)
		garage.accept(broken_bike)
		expect(garage.available_bikes).to eq 2
	end

end
