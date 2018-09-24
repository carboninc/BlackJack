# Game Menu
class Menu
  include Config
  include SharedHelpers

  def initialize(game)
    @game = game
  end

  def game_table
    console_separator
    show_bank
    cards_and_point_player
    cards_and_point_dealer
    run_player
  end

  def run_player
    @game.check_open_cards
    puts 'Ваш ход, выберите действие:'
    puts '----------------------------'
    puts '1. Пропустить'
    puts '2. Добавить карту' if @game.player.cards.length <= 2
    puts '3. Открыть карты'
    selected = gets.chomp.to_i
    choosing_run_player(selected)
  end

  def new_game
    puts 'Хотите сыграть еще раз?'
    puts '1. Да'
    puts '2. Нет'
    selected = gets.chomp.to_i
    choosing_new_game(selected)
  end

  def end_game
    puts 'Игра окончена!'
    cards_and_point_player
    puts '----------------------------'
    puts "Карты #{@game.dealer.name}"
    puts @game.dealer.cards
    puts "Сумма очков: #{@game.dealer.points}"
    console_separator
  end

  private

  def show_bank
    puts "В банке: #{@game.bank}$"
    puts "На счету игрока: #{@game.player.bank}$"
    puts "На счету диллера: #{@game.dealer.bank}$"
    puts '----------------------------'
  end

  def cards_and_point_player
    puts "Карты #{@game.player.name}"
    puts @game.player.cards
    puts "Сумма очков: #{@game.player.points}"
    puts '----------------------------'
  end

  def cards_and_point_dealer
    puts "Карты #{@game.dealer.name}"
    @game.dealer.cards.length.times { puts '*' }
    puts '----------------------------'
  end

  def choosing_new_game(selected)
    case selected
    when 1
      @game.reset_game
      @game.starting_cards
      game_table
    when 2
      abort('Всего доброго!')
    else
      error_input(:new_game)
    end
  end

  def choosing_run_player(selected)
    case selected
    when 1
      @game.run_dealer
    when 2
      check_run_player
    when 3
      @game.open_cards
    else
      error_input(:run_player)
    end
  end

  def check_run_player
    return choosing_run_player(0) if @game.player.cards.length >= 3
    @game.run_player
  end
end
