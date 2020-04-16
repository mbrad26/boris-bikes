require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  
  it { is_expected.to respond_to(:bike) }
  
  describe '#release_bike' do
    it 'returns a bike' do
      expect(subject.release_bike).to be_a_kind_of(Bike)
    end
  end
  
  describe '#dock_bike' do
    it 'docks a bike' do
      bike = Bike.new
      
      expect { subject.dock_bike(bike) }.to change(subject, :bike).to eq bike
    end
  end
end
