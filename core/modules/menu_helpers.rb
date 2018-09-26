# Various helpers for the Black Jack
module MenuHelpers
  include Config

  private

  def check_run_player
    return choosing_run_player(0) if @game.player.cards.length >= 3
    @game.run_player
    run_dealer
    game_table
  end

  def check_pass_dealer
    pass_dealer = proc do
      console_separator
      puts 'Диллер пропустил ход'
      game_table
    end
    pass_dealer.call if @game.dealer.points >= 17
  end

  def check_open_cards
    check_players_cards
    check_players_points
  end

  def check_players_cards
    open_cards if @game.player.cards.length >= 3 &&
                  @game.dealer.cards.length >= 3
  end

  def check_players_points
    open_cards if @game.player.points > BJ ||
                  @game.dealer.points > BJ
  end
end
