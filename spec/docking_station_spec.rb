require 'docking_station'
require 'bike'

describe DockingStation do

  describe '#initialize' do
    subject { DockingStation.new}
    let(:bike) { Bike.new }

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'has a variable capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.dock_bike(bike) }

      expect { subject.dock_bike(Bike.new) }.to raise_error 'Station is full'
    end
  end

  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike) }

    it 'returns a bike' do
      bike = Bike.new
      2.times { subject.dock_bike(bike) }

      expect(subject.release_bike).to eq(bike)
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error if bike is broken' do
      subject { DockingStation.new }
      bike = Bike.new
      bike.report_broken

      subject.dock_bike(bike)

      expect { subject.release_bike }.to raise_error 'Bike is faulty!'
    end
  end

  describe '#dock_bike' do
    it { is_expected.to respond_to(:dock_bike).with(1).argument }

    it 'docks a bike' do
      bike = Bike.new

      expect { subject.dock_bike(bike) }.to change(subject, :bikes).to include(bike)
    end

    context 'when station is full' do
      it 'raises an error' do
        subject.capacity.times { subject.dock_bike(Bike.new) }
        # allow(subject).to receive(:full?).and_return true

        expect { subject.dock_bike(Bike.new) }.to raise_error 'Station is full'
      end
    end

    context 'when bike is broken' do
      it 'docks the bike' do
        subject { DockingStation.new }
        bike = Bike.new
        bike.report_broken

        subject.dock_bike(bike)

        # expect(subject.bikes).to include(bike)
        expect { subject.dock_bike(bike)}.to change(subject, :bikes).to include(bike)
      end
    end
  end

  describe '#bikes' do
    it { is_expected.to respond_to(:bikes) }

    it 'returns an array' do
      expect(subject.bikes).to be_a_kind_of(Array)
    end
  end
end
