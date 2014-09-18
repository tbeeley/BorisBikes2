require 'van'

describe Van do

	let(:van) { Van.new }
	let(:working_bike) { double :bike, broken?: false, instance_of?: 'Bike' }
	let(:broken_bike) { double :bike, broken?: true, instance_of?: 'Bike' }
	let(:station) { double :docking_station, broken_bikes: [broken_bike], working_bikes: [working_bike], release: broken_bike, accept: nil}
	let(:garage) 		{ double :garage, working_bikes: [working_bike], accept: nil, release: working_bike}

	it_behaves_like 'a bike container'

	it 'has no bikes when created' do
		expect(van.bike_count).to eq 0
	end

	it 'should collect broken bikes from the docking_station' do
		van.collect_broken_bikes_from(station)
		expect(van.bikes).to eq [broken_bike]
	end

	it 'should release the broken bikes at the garage' do
		van.bikes = [broken_bike]
		van.deposit_bikes_at(garage)
		expect(van.broken_bikes).to eq []
	end

	it 'should collect the fixed bikes from the garage' do
		van.bikes = []
		van.collect_fixed_bikes_from(garage)
		expect(van.bikes).to eq [working_bike]
	end

	it 'should release the fixed bikes at the station' do
		van.bikes = [working_bike]
		van.deposit_fixed_bikes_at(station)
		expect(van.bikes).to eq []
	end

end
