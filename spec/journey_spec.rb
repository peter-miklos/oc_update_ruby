require 'journey'

describe Journey do

  let(:station_1) { double :station_1 }
  let(:station_2) { double :station_2 }
  let(:journey) { described_class.new(station_1)}

  describe "#initialize" do
    it "starts journey with an entry station" do
      expect(journey.instance_variable_get("@entry_station")).to eq station_1
    end

    it "add the minimum fare to the fare" do
      min_fare = Journey::MIN_FARE
      expect(journey.instance_variable_get("@fare")).to eq min_fare
    end
  end

  describe "#finish" do
    it "defines the exit_station" do
      journey.finish(station_2)
      expect(journey.instance_variable_get("@exit_station")).to eq station_2
    end

    it "calculates the fare for the journey" do
      # TBD
    end
  end

end
