require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  
  it { is_expected.to respond_to(:bikes) }
  
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
      
      expect { subject.dock_bike(bike) }.to change(subject, :bikes).to include(bike)
    end
    
    it 'raises an error when there is already in the station' do
      20.times { subject.dock_bike(Bike.new) }
      
      another_bike = Bike.new
      
      expect { subject.dock_bike(another_bike) }.to raise_error 'Station is full'
    end
  end
  
  describe '#bikes' do
    it 'returns an array' do
      expect(subject.bikes).to be_a_kind_of(Array)
    end
  end
end
