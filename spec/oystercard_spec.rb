require 'oystercard'

describe Oystercard do
  let(:minimum_balance) { Oystercard::MIN_BALANCE }
  let(:minimum_fare) { Oystercard::MIN_FARE }
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }

  describe 'initialization' do
    it 'card is initialized with an empty list of journeys' do
      expect(subject.journeys).to eq([])
    end
  end

  it { is_expected.to respond_to :balance }

  it 'balance' do
    expect(subject.balance).to eq 0
  end

  describe 'top_up' do
    it 'tops up card balance' do
      expect { subject.top_up 5 }.to change { subject.balance }.by 5
    end

    it 'limits the card balance to the maximum balance' do
      maximum_balance = Oystercard::MAX_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "Balance cannot be more than #{maximum_balance}"
    end
  end

  describe 'touch_in' do
    it 'can touch in' do
      subject.top_up(minimum_balance)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end

    it 'raises an error if you try to touch in without enough money' do
      expect { subject.touch_in(entry_station) }.to raise_error "Need minimum balance of £#{minimum_balance}"
    end

    it 'remembers the station that was touched in' do
      subject.top_up(minimum_balance)
      subject.touch_in(entry_station)
      expect(subject.journey[:entry_station]).to eq(entry_station)
    end
  end

  describe 'touch_out' do
    it 'can touch out' do
      subject.top_up(minimum_balance)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end

    it 'reduces balance by minimum fare' do
      subject.top_up(minimum_balance)
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-minimum_fare)
    end
  end

  describe 'in_journey?' do
    it 'confirms if the card is in use' do
      subject.top_up(minimum_balance)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to eq true
    end
  end

  describe 'journeys' do
    it 'returns journeys' do
      subject.top_up(minimum_balance)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include(entry_station: entry_station, exit_station: exit_station)
    end
  end
end
