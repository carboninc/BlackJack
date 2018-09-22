# BlackJack Menu
module Menu
  def start
    puts 'Для начала игры укажите свое имя:'
    name = gets.chomp.capitalize
    start_game(name)
  end
end
