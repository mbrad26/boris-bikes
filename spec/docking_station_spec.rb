require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  
  it { is_expected.to respond_to(:bike) }
  
  describe '#release_bike' do
    it 'returns a bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      
      expect(subject.release_bike).to eq(bike)
    end
    
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  
  describe '#dock_bike' do
    it 'docks a bike' do
      bike = Bike.new
      
      expect { subject.dock_bike(bike) }.to change(subject, :bike).to eq bike
    end
    
    it 'raises an error when there is already in the station' do
      bike = Bike.new
      subject.dock_bike(bike)
      
      another_bike = Bike.new
      
      expect { subject.dock_bike(another_bike) }.to raise_error 'Station is full'
    end
  end
end
