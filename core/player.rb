# Player Class
class Player
  include Config
  attr_reader :name, :bank
  attr_accessor :cards
  def initialize(name)
    @name = name
    @bank = BANK
    @cards = []
  end
end
