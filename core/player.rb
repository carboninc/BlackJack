# Player Class
class Player
  include Config
  attr_reader :name
  attr_accessor :cards, :bank, :points
  def initialize(name)
    @name = name
    @bank = BANK
    @cards = []
    @points = 0
  end
end
