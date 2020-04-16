require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  
  describe '#release_bike' do
    it 'returns a bike' do
      expect(subject.release_bike).to be_a_kind_of(Bike)
    end
  end
end
