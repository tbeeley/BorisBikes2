require 'van'

describe Van do

	let(:van) { Van.new }
	let(:working_bike) { double :bike, broken?: false }
	let(:broken_bike) { double :bike, broken?: true }
	let(:station) { double :docking_station, broken_bikes: [broken_bike], release: broken_bike}
	let(:another_station) { double :docking_station}
	let(:garage) 		{ double :garage}

	it_behaves_like 'a bike container'

	it 'has no bikes when created' do
		expect(van.bike_count).to eq 0
	end

	it 'should collect broken bikes from the docking_station' do
		van.collect_bikes_from(station)
		expect(van.bikes).to eq [broken_bike]
	end


end
