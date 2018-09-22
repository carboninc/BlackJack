# Player Class
class Player
  include Config
  attr_reader :name
  attr_accessor :cards, :bank
  def initialize(name)
    @name = name
    @bank = BANK
    @cards = []
  end
end
