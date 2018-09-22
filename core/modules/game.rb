# Game Module
module Game
  def start_game(player)
    @player = Player.new(player)
    @dealer = Dealer.new
  end
end
