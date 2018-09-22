# BlackJack Menu
module Menu
  def start
    puts 'Для начала игры укажите свое имя:'
    name = gets.chomp.capitalize
    Player.new(name)
  end
end
