require 'bike'

describe Bike do

	let (:bike) { Bike.new }

	context 'when created' do

		it 'should not be broken' do
			expect(bike).not_to be_broken
		end

	end

	context 'after creation' do

		before do
			bike.break
		end

		it 'should be able to be broken' do
			expect(bike).to be_broken
		end

		it 'should be able to be fixed' do
			bike.fix
			expect(bike).not_to be_broken
		end

	end

end
