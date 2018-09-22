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
    @player.cards << @deck[0..1]
    @dealer.cards << @deck[2..3]
  end

  def give_cards
    puts 'Раздача карт'
    puts "Карты #{@player.name}"
    puts @player.cards
    puts "Карты #{@dealer.name}"
    2.times { puts '*' }
  end

end
