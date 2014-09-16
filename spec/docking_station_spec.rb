require 'docking_station'

describe 'DockingStation' do

	let(:docking_station) { DockingStation.new }
	let(:bike) 			  { Bike.new		   }

	context 'when created' do

		it 'should not have any bikes' do
			expect(docking_station.bike_count).to eq 0
		end

	end

	context 'docking and releasing' do

		it 'should be able to dock a bike' do
			docking_station.accept(bike)
			expect(docking_station.bike_count).to eq 1
		end
	end
end
