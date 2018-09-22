# Cards Class
class Cards
  attr_reader :cards
  attr_accessor :deck
  def initialize
    @deck = {}
  end

  def create_deck
    create_cards
    create_suit_cards
    @deck = @deck.merge(@clubs).merge(@diamonds).merge(@hearts).merge(@spades)
    @deck = @deck.to_a.shuffle.to_h
  end

  private

  def create_cards
    numbers = Hash[('2'..'10').collect { |card| [card.to_s, card.to_i] }]
    images = Hash[%w[J Q K A].collect { |card| [card.to_s, 10] }]
    @cards = numbers.merge(images)
  end

  def create_suit_cards
    @clubs = @cards.transform_keys { |key| key + '♣' }
    @diamonds = @cards.transform_keys { |key| key + '♦' }
    @hearts = @cards.transform_keys { |key| key + '♥' }
    @spades = @cards.transform_keys { |key| key + '♠' }
  end
end
