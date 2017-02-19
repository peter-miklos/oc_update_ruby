require 'journey_log'

describe JourneyLog do

  let(:journey_class) {double(:journey_class, new: journey)}
  let(:journey) { double(:journey, finish: true) }
  let(:journey_log) { described_class.new(journey_class) }
  let(:station_1) { double :station_1 }
  let(:station_2) { double :station_2 }

  describe "#initialize" do

  end

  describe "#start" do
    it "instantiate a new journey" do
      expect(journey_class).to receive(:new).with(station_1)
      journey_log.start(station_1)
    end

    it "stores the new journey in the @current_journey" do
      journey_log.start(station_1)
      expect(journey_log.instance_variable_get("@current_journey")).to eq journey
    end
  end

  describe "#finish" do

    before(:each) do
      journey_log.start(station_1)
    end

    it "calls the finish method on the journey with a station" do
      expect(journey).to receive(:finish).with(station_2)
      journey_log.finish(station_2)
    end

    it "adds the completed journey to the list of journeys" do
      current_journey = journey_log.instance_variable_get("@current_journey")
      journey_log.finish(station_2)
      expect(journey_log.instance_variable_get("@journeys").last).to eq current_journey
    end

    it "sets the current_journey to nil" do
      journey_log.finish(station_2)
      expect(journey_log.instance_variable_get("@current_journey")).to be_nil
    end
  end

  describe "#in_journey?" do
    it "returns true if card was touched in but there was no touch out" do
      journey_log.start(station_1)
      expect(journey_log.in_journey?).to be_truthy
    end
  end

  describe "#outstanding_charge" do
    it "returns the outstanding_charge" do
      # TBD
    end

    it "set the outstanding_charge to zero" do
      # TBD
    end
  end

end
