require 'station'

describe Station do
  let(:station) { described_class.new("Paddington", 1)}
  
  describe "#name" do
    it "stores the name of the station" do
      expect(station.instance_variable_get("@name")).to eq "Paddington"
    end
  end

  describe "#zone" do
    it "stores the zone of the station" do
      expect(station.zone).to eq 1
    end
  end
end
