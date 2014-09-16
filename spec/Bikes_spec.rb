require 'bikes'

describe 'bikes' do

	let (:bike) { Bike.new }

	context 'when created' do
		it 'should not be broken' do
			expect(bike).not_to be_broken
		end
	end

	context 'after creation' do
		it 'should be able to be broken' do
			bike.break
			expect(bike).to be_broken
		end

	end

end
