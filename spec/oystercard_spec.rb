require 'oystercard'

describe Oystercard do

  let(:card) { described_class.new }

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
      max_b = card.instance_variable_get("@max_balance")
      expect{card.top_up(91)}.to raise_error("You cannot exceed the max balance (£#{max_b})")
    end
  end
end
