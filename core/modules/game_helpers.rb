# Various helpers for the Black Jack
module GameHelpers
  include Config

  def reset_game
    check_money
    @player.reset
    @dealer.reset
    @bank = 0
    @deck = Cards.new.create_deck
    @cards = @deck.keys
  end

  def check_open_cards
    check_players_cards
    check_players_points
  end

  private

  # Checks
  def check_players_cards
    open_cards if @player.cards.length >= 3 &&
                  @dealer.cards.length >= 3
  end

  def check_players_points
    open_cards if @player.points > BJ ||
                  @dealer.points > BJ
  end
  # ------------------------------------------------------

  # Game Result
  def compare_points(player, dealer)
    if (player > dealer && player <= BJ) || dealer > BJ
      puts 'Вы выиграли'
      @player.bank += @bank
    elsif player < dealer || player > BJ
      puts 'Вы проиграли'
      @dealer.bank += @bank
    else
      puts 'Ничья'
      draw
    end
  end

  def draw
    @player.bank += 10
    @dealer.bank += 10
  end
  # ------------------------------------------------------

  # Reset Game
  def check_money
    abort('У вас не хватает денег! Приходите позже') if @player.bank.zero?
    abort('У диллера нет денег! Приходите позже') if @dealer.bank.zero?
  end
  # ------------------------------------------------------
end
