require 'bike_container'

shared_examples 'a bike container' do

	let(:container) 	{ described_class.new }
	let(:working_bike) { double :bike, broken?: false }
	let(:broken_bike) { double :bike, broken?: true }


	context 'when created' do

		it 'should not have any bikes' do
			expect(container.bike_count).to eq 0
		end

		it 'should have a capacity' do
			expect(container.capacity).to eq 20
		end

	end

	context 'bike container' do

		it 'should know when it is full' do
			20.times { container.accept(working_bike) }
			expect(container.full?).to be true
		end

		it 'should know when it is empty' do
			expect(container.bike_count).to eq 0
			expect(container.empty?).to eq true
		end

		it 'should know how many bikes are available' do
			container.accept(working_bike)
			container.accept(broken_bike)
			expect(container.available_bikes).to eq 1
		end

		it 'should have a list of working bikes' do
			container.accept(working_bike)
			container.accept(broken_bike)
			expect(container.working_bikes).to eq [working_bike]
		end

		it 'should have a list of broken bikes' do
			container.accept(working_bike)
			container.accept(broken_bike)
			expect(container.broken_bikes).to eq [broken_bike]
		end

	end

	context 'docking and releasing' do

		it 'should be able to dock a bike' do
			container.accept(working_bike)
			expect(container.bike_count).to eq 1
		end

		it 'should be able to release a bike' do
			container.accept(working_bike)
			container.release(working_bike)
			expect(container.bike_count).to eq 0
		end

		it 'should not accept a bike if full' do
			20.times { container.accept(working_bike) }
			expect(lambda { container.accept(working_bike) }).to raise_error('This container is full')
		end

		it 'should not release a bike if empty' do
			expect(lambda { container.release(working_bike) }).to raise_error('There are no available bikes')
		end

	end
end
