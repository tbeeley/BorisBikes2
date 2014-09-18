require 'bike_container'

shared_examples 'a bike container' do

	let(:container) 	{ described_class.new }
	let(:working_bike) { double :bike, broken?: false, instance_of?: 'Bike' }
	let(:broken_bike) { double :bike, broken?: true, instance_of?: 'Bike' }
	let(:garage) { double :garage }

	def different_bikes
		container.accept(working_bike)
		container.accept(broken_bike)
	end

	context 'when created' do

		it 'should not have any bikes' do
			expect(container.bike_count).to eq 0
		end

		it 'should have a capacity' do
			expect(container.capacity).to eq 20
		end

	end

	context 'should know' do

		it 'it is empty' do
			expect(container.bike_count).to eq 0
			expect(container.empty?).to eq true
		end

		it 'how many bikes are available' do
			different_bikes
			expect(container.available_bikes).to eq 1
		end

		it 'its working bikes' do
			different_bikes
			expect(container.working_bikes).to eq [working_bike]
		end

		it 'its broken bikes' do
			different_bikes
			expect(container.broken_bikes).to eq [broken_bike]
		end

	end

	context 'when full' do

		before do
			20.times { container.accept(working_bike) }
		end

		it 'should know when it is full' do
			expect(container.full?).to be true
		end

		it 'should not accept a bike if full' do
			expect(lambda { container.accept(working_bike) }).to raise_error('This container is full')
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

		it "should raise an error before a non-bike is released" do
			expect(lambda { container.release(garage) }).to raise_error("We can't give you what you're asking for")
		end

		it 'should raise an error before a non-bike is accepted' do
			expect(lambda {container.accept(garage)}).to raise_error('That aint no bike')
		end

	end
end
