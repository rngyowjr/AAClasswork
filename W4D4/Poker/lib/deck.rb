require_relative "card.rb"
require "byebug"


class Deck
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def fill_cards
    values = ["A", "K", "Q", "J", 10, 9, 8, 7, 6, 5, 4, 3, 2]
    suits = ["♥︎", "♦︎", "♠︎", "♣︎"] 
    suits.each do |suit|
      values.each do |value|
        @cards << Card.new(value, suit)
      end
    end
    @cards
  end

  def to_s
    " #{symbol} "
  end

end