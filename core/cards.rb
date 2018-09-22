# Cards Class
class Cards
  attr_reader :deck
  def initialize
    @deck ||= []
  end

  def create_deck
    @numbers = (1..10).to_a
    @images = %w[J Q K A]
    @cards = @numbers + @images
    @suits = ['♠', '♥', '♦', '♣']
    @suits.each do |suit|
      @cards.collect { |card| @deck << card.to_s + suit }
    end
    @deck.shuffle!
  end
end
