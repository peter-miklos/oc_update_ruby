require 'oystercard'

describe Oystercard do

  let(:card) { described_class.new }

  describe "balance" do
    it "has 0 initially" do
      expect(card.instance_variable_get("@balance")).to eq 0
    end
  end
end
