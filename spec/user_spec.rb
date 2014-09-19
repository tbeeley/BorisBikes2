require 'user'

describe 'a user' do

	let(:user) { User.new('Pom') }
	let(:working_bike) { double :bike, instance_of?: 'Bike', broken?: false, break!: nil}
	let(:broken_bike) { double :bike, broken?: true, instance_of?: 'Bike' }
	let(:garage) { double :garage }

	context 'when initialized' do

		it 'should have a name' do
			expect(user.name).to eq('Pom')
		end

	end

	context 'when renting and returning' do

		it 'should be able to rent a bike' do
			user.rent(working_bike)
			expect(user.bikes).to eq [working_bike]
		end

		it 'should be able to break a bike' do
			expect(working_bike).to receive(:break!)
			user.fall_down(working_bike)
		end

		it 'should not be able to rent a broken bike' do
			expect( lambda { user.rent(broken_bike) }).to raise_error('Unfortunately, that bike is broken')
		end

		it 'should not be able to rent more than one bike at the same time' do
			expect( lambda { 2.times { user.rent(working_bike) }}).to raise_error('You can only rent one bike at a time')
		end

		it 'should not accept something that is not a bike' do
			expect( lambda { user.rent(garage) }).to raise_error("Whoops, that doesn't seem to be a bike")
		end

	end
end
