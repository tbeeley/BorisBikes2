require 'docking_station'

describe 'DockingStation' do

	let(:docking_station) { DockingStation.new }

	context 'when created' do

		it 'should not have any bikes' do
			expect(docking_station.bike_count).to eq 0
		end

	end
end
