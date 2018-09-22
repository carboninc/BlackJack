# Game Module
module Game
  def start_game(player)
    @player = Player.new(player)
    @dealer = Dealer.new
    @deck = Cards.new.create_deck
    starting_cards
    give_cards
  end

  def starting_cards
    @player.cards << @deck[0]
    @player.cards << @deck[1]
    @dealer.cards << @deck[2]
    @dealer.cards << @deck[3]
  end

  def sum_points
    sum = 0
    @player.cards.each do |card|
      sum += Integer(card[0]) if card[0].to_i > 2
      sum += 1 if card[0] == 'A'
      sum += 10 if card[0].to_i.zero?
    end
    @sum_points = sum
  end

  def give_cards
    puts 'Раздача карт'
    puts "Карты #{@player.name}"
    puts @player.cards
    puts "Сумма очков: #{sum_points}"
    puts "Карты #{@dealer.name}"
    2.times { puts '*' }
  end

end
