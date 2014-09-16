require 'bike_container'
require 'bike'

class ContainerHolder; include BikeContainer

	describe BikeContainer do

		let(:container) 	{ ContainerHolder.new  }
		let(:bike) 			{ Bike.new	}
		let(:broken_bike) { Bike.new (true) }


		context 'when created' do

			it 'should not have any bikes' do
				expect(container.bike_count).to eq 0
			end

			it 'should have a capacity' do
				expect(container.capacity).to eq 20
			end

			it 'should know when it is full' do
				20.times { container.accept(bike) }
				expect(container.full?).to be true
			end

			it 'should know when it is empty' do
				expect(container.bike_count).to eq 0
				expect(container.empty?).to eq true
			end

			it 'should know how many bikes are available' do
				container.accept(bike)
				container.accept(broken_bike)
				expect(container.available_bikes).to eq 1
			end

		end

		context 'docking and releasing' do

			it 'should be able to dock a bike' do
				container.accept(bike)
				expect(container.bike_count).to eq 1
			end

			it 'should be able to release a bike' do
				container.accept(bike)
				container.release(bike)
				expect(container.bike_count).to eq 0
			end

			it 'should not accept a bike if full' do
				20.times { container.accept(bike) }
				expect(lambda { container.accept(bike) }).to raise_error('This container is full')
			end

			it 'should not release a bike if empty' do
				expect(lambda { container.release(bike) }).to raise_error('There are no available bikes')
			end

		end

	end
end
