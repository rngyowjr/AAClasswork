require "deck.rb"

describe "Deck" do
  describe "#initialize" do
    deck = Deck.new
    it "should initialize an empty array to be filled" do
      expect(deck.cards).to eq([])
    end
  end

  describe "#fill_cards" do
    deck = Deck.new
    deck.fill_cards
    it "should fill the deck with all cards except jokers" do
      expect(deck.cards.length).to eq(52)
    end
    it "should fill the deck with all unique cards" do
      expect(deck.cards).to eq(deck.cards.uniq)
    end

  end

end