require 'bike'

describe Bike do

  it { is_expected.to respond_to(:working?) }

  describe '#working?' do
    context 'when bike is in working condition' do
      it 'returns true' do
        expect(subject.working?).to be true
      end
    end
  end
end
