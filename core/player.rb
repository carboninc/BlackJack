# Player Class
class Player
  include Config
  include Validation

  attr_reader :name
  attr_accessor :cards, :bank, :points

  validate :name, :presence
  validate :name, :name_length

  def initialize(name)
    @name = name
    @bank = BANK
    @cards = []
    @points = 0
    validate!
  end

  def reset
    @cards = []
    @points = 0
  end
end
