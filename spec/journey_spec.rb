require 'journey'

describe Journey do

  let(:station_1) { double :station_1 }
  let(:station_2) { double :station_2 }
  let(:journey) { described_class.new(station_1)}

  describe "#initialize" do
    it "starts journey with an entry station" do
      expect(journey.instance_variable_get("@entry_station")).to eq station_1
    end

    it "has a minimum fare constant of 1" do
      expect(Journey::MIN_FARE).to eq 1
    end

    it "has a penalty fare constant of 6" do
      expect(Journey::PENALTY_FARE).to eq 6
    end
  end

  describe "#finish" do
    it "defines the exit_station" do
      journey.finish(station_2)
      expect(journey.instance_variable_get("@exit_station")).to eq station_2
    end

    it "returns the min fare if there are entry and exit stations added" do
      expect(journey.finish(station_2)).to eq Journey::MIN_FARE
    end

    it "returns penalty fare if exit station is missing" do
      expect(journey.finish(nil)).to eq Journey::PENALTY_FARE
    end

    it "returns penalty fare if entry station is missing" do
      journey_2 = described_class.new(nil)
      expect(journey_2.finish(station_2)).to eq Journey::PENALTY_FARE
    end
  end

end
