require "card.rb"

describe "Card" do
  describe "#initialize" do
    queen = Card.new("Q", "H")
    it "should initialize card instance with given value and suit" do
      expect(queen.val).to eq("Q")
      expect(queen.suit).to eq("H")
    end
  end
end
