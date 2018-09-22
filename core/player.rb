# Player Class
class Player
  include Config
  attr_reader :name, :bank
  def initialize(name)
    @name = name
    @bank = BANK
  end
end
