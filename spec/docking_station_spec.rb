require 'docking_station'

describe 'DockingStation' do

	let(:station) { DockingStation.new }
	let(:bike) 			  { Bike.new		   }
	let(:broken_bike) { Bike.new (true)}

	context 'when created' do

		it 'should not have any bikes' do
			expect(station.bike_count).to eq 0
		end

		it 'should have a capacity' do
			expect(station.capacity).to eq 20
		end

		it 'should know when it is full' do
			20.times { station.accept(bike) }
			expect(station.full?).to be true
		end

		it 'should know when it is empty' do
			expect(station.bike_count).to eq 0
			expect(station.empty?).to eq true
		end

	end

	context 'docking and releasing' do

		it 'should be able to dock a bike' do
			station.accept(bike)
			expect(station.bike_count).to eq 1
		end

		it 'should be able to release a bike' do
			station.accept(bike)
			station.release(bike)
			expect(station.bike_count).to eq 0
		end

		it 'should not accept a bike if full' do
			20.times { station.accept(bike) }
			expect(lambda { station.accept(bike) }).to raise_error('This station is full')
		end

		it 'should not release a bike if empty' do
			expect(station.bike_count).to eq 0
			expect(lambda { station.release(bike) }).to raise_error('There are no available bikes')
		end

		it 'should not release a bike if broken' do
			station.accept(broken_bike)
			expect(lambda { station.release(broken_bike) }).to raise_error('This bike is broken')

		end

	end

end
