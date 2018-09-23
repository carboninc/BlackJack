# Various helpers for the Black Jack
module Helpers
  include Config

  private

  def error_input(return_route)
    error_input = proc do
      puts 'Ошибка ввода, такого варианта нет!'
      console_separator
      send(return_route)
    end
    error_input.call
  end

  def console_separator
    puts ''
    puts '----------------------------'
    puts ''
  end

  def check_money
    abort('У вас не хватает денег! Приходите позже') if @player.bank.zero?
    abort('У диллера закончились деньги! Приходите позже') if @dealer.bank.zero?
  end

  def reset_game
    check_money
    @bank = 0
    @player.cards = []
    @dealer.cards = []
    @player.points = 0
    @dealer.points = 0
    @deck = Cards.new.create_deck
    @game_deck = @deck.clone
  end

  def pass_dealer(return_route)
    pass_dealer = proc do
      console_separator
      puts 'Диллер пропустил ход'
      console_separator
      send(return_route)
    end
    pass_dealer.call if @dealer.points >= 17
  end

  def compare_points(player, dealer)
    if (player > dealer && player <= BJ) || dealer > 21
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
end
