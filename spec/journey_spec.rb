require 'journey'
require 'oystercard'

describe Journey do
    card = Oystercard.new
    let(:entry_station) { double(:station) }
    let(:exit_station) { double(:station)}


    describe 'start_journey' do

      it 'starts the journey' do
        # journey = Journey.new
        card.top_up(10)
        card.touch_in(entry_station)
        subject.start_journey(entry_station)
        expect(subject.in_journey).to eq(true)
        expect(subject.journey[:entry_station]).to eq(entry_station)
      end

      it 'incomplete journey: did not touch out' do
        # journey = Journey.new
        card.top_up(10)
        card.touch_in(entry_station)
        subject.start_journey(entry_station)
        card.touch_in('bank')
        subject.start_journey('bank')
        card.touch_out(exit_station)
        subject.complete_journey(exit_station)
        expect(subject.journeys).to include({:entry_station=>entry_station, :exit_station=>'Did not tap out'}, {:entry_station=>'bank', :exit_station=>exit_station})
        #expect(subject.journey[:exit_station]).to eq('did not tap out')

      end
    end

    describe 'complete_journey' do
      it 'completes the current journey' do
        card.top_up(10)
        subject.start_journey(entry_station)
        subject.complete_journey(exit_station)
        expect(subject.in_journey).to eq(false)
        expect(subject.journey[:exit_station]).to eq(exit_station)
      end

    end
  #   describe 'in_journey?' do
  #   it 'confirms if the card is in use' do
  #     journey = Journey.new
  #     card.top_up(10)
  #     card.touch_in('bank')
  #     expect(journey.in_journey?).to eq true
  #   end
  # end

  describe 'journeys' do
    it 'returns journeys' do
      card.top_up(10)
      subject.start_journey(entry_station)
      subject.complete_journey(exit_station)
      expect(subject.journeys).to include(:entry_station=>entry_station, :exit_station=>exit_station)
    end
  end
end
