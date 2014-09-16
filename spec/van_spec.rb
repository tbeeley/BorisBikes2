require 'van'

describe Van do

	let(:van) { Van.new }
	let(:station) { DockingStation.new  }
	let(:bike) 			  { Bike.new	}

	it 'has no bikes when created' do
		expect(van.bike_count).to eq 0
	end

end
