require 'oystercard'

describe Oystercard do

  let(:journey_log) {double(:journey_log, start: true, finish: 1, get_fare: 1, in_journey?: false)}
  let(:station_1) {double :station_1}
  let(:station_2) {double :station_2}
  let(:card) { described_class.new(journey_log) }

  describe "balance" do
    it "has 0 initially" do
      expect(card.instance_variable_get("@balance")).to eq 0
    end
  end

  describe "top_up" do
    it "tops up the card with a defined amount" do
      card.top_up(5)
      expect(card.instance_variable_get("@balance")).to eq 5
    end

    it "doesn't let user to have higher balance than the max" do
      max_b = Oystercard::MAX_BALANCE
      expect{card.top_up(91)}.to raise_error("You cannot exceed the max balance (£#{max_b})")
    end
  end

  describe "touch_in" do
    before(:each) { card.top_up(2) }

    it "calls the start method on journey_log with a station" do
      expect(journey_log).to receive(:start).with(station_1)
      card.touch_in(station_1)
    end

    it "raises error if the balance is too low to enter the station" do
      card.touch_out(station_2)
      expect{card.touch_in(station_1)}.to raise_error("Your balance is too low, please top-up")
    end

    it "calls get_fare method on journey_log" do
      expect(journey_log).to receive(:get_fare)
      card.touch_in(station_1)
    end

    it "deducts the possible charge if touch_out was missed" do
      card.touch_in(station_1)
      expect(card.instance_variable_get("@balance")).to eq 1
    end
  end

  describe "touch_out" do

    before(:each) do
      card.top_up(3)
      card.touch_in(station_1)
      allow(journey_log).to receive(:in_journey?).and_return(true)
      allow(journey_log).to receive(:get_fare).and_return(1)
    end

    it "calls the finish method on journey_log with a station" do
      expect(journey_log).to receive(:finish).with(station_2)
      card.touch_out(station_2)
    end

    it "calls the get_fare method on journey_log" do
      expect(journey_log).to receive(:get_fare)
      card.touch_out(station_2)
    end

    it "deducts the fare from the balance" do
      card.touch_out(station_2)
      expect(card.instance_variable_get("@balance")).to eq 1
    end

    it "raises error if the balance is low at touch out" do
      card.touch_out(station_2)
      expect{card.touch_out(station_2)}.to raise_error("Your balance is too low, please top-up")
    end
  end
end
