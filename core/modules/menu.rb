# BlackJack Menu
module Menu
  def start
    puts 'Для начала игры укажите свое имя:'
    name = gets.chomp.capitalize
    start_game(name)
  end

  def give_cards_menu
    give_cards_start_menu
    puts "Карты #{@player.name}"
    puts @player.cards
    puts "Сумма очков: #{sum_points}"
    puts '----------------------------'
    puts "Карты #{@dealer.name}"
    2.times { puts '*' }
    run_player_menu
  end

  def run_player_menu
    puts 'Ваш ход, выберите действие:'
    puts '----------------------------'
    puts '1. Пропустить'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    selected = gets.chomp.to_i
    run_player(selected)
  end

  private

  def give_cards_start_menu
    puts "В банке: #{@bank}"
    puts "На счету игрока: #{@player.bank}"
    puts "На счету диллера: #{@dealer.bank}"
    puts '----------------------------'
  end
end
