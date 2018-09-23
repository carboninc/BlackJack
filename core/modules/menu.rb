# BlackJack Menu
module Menu
  include Config

  def start
    puts 'Для начала игры укажите свое имя:'
    name = gets.chomp.capitalize
    console_separator
    puts 'Начнем:'
    start_game(name)
  end

  def give_cards_menu
    console_separator
    give_cards_start_menu
    give_cards_player_menu
    give_cards_dealer_menu
    run_player_menu
  end

  def run_player_menu
    puts 'Ваш ход, выберите действие:'
    puts '----------------------------'
    puts '1. Пропустить'
    puts '2. Добавить карту' if @player.cards.length <= 2
    puts '3. Открыть карты'
    selected = gets.chomp.to_i
    run_player(selected)
  end

  def new_game_menu
    puts 'Хотите сыграть еще раз?'
    puts '1. Да'
    puts '2. Нет'
    selected = gets.chomp.to_i
    new_game(selected)
  end

  def end_game_menu
    puts 'Игра окончена!'
    puts "Карты #{@player.name}"
    puts @player.cards
    puts "Сумма очков: #{@player.points}"
    puts '----------------------------'
    puts "Карты #{@dealer.name}"
    puts @dealer.cards
    puts "Сумма очков: #{@dealer.points}"
    console_separator
  end

  private

  def give_cards_start_menu
    puts "В банке: #{@bank}$"
    puts "На счету игрока: #{@player.bank}$"
    puts "На счету диллера: #{@dealer.bank}$"
    puts '----------------------------'
  end

  def give_cards_player_menu
    puts "Карты #{@player.name}"
    puts @player.cards
    puts "Сумма очков: #{sum_points(@player)}"
    return open_cards if @player.points > BJ
    puts '----------------------------'
  end

  def give_cards_dealer_menu
    puts "Карты #{@dealer.name}"
    @dealer.cards.length.times { puts '*' }
    sum_points(@dealer)
    return open_cards if @dealer.points > BJ
    puts '----------------------------'
  end
end
