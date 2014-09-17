require 'van'

describe Van do

	let(:van) { Van.new }
	let(:working_bike) { double :bike, broken?: false }
	let(:broken_bike) { double :bike, broken?: true }
	let(:station) { double :docking_station, broken_bikes: [broken_bike], release: broken_bike}
	let(:another_station) { double :docking_station}
	let(:garage) 		{ double :garage, accept: nil}

	it_behaves_like 'a bike container'

	it 'has no bikes when created' do
		expect(van.bike_count).to eq 0
	end

	it 'should collect broken bikes from the docking_station' do
		van.collect_bikes_from(station)
		expect(van.bikes).to eq [broken_bike]
	end

	it 'should release the broken bikes at the garage' do
		van.bikes = [broken_bike]
		van.deposit_bikes_at(garage)
		expect(van.broken_bikes).to eq []
	end

end
