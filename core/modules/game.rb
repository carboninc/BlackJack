# Game Module
module Game
  def start_game(player)
    @player = Player.new(player)
    @dealer = Dealer.new
    @deck = Cards.new.create_deck
    @bank = 0
    starting_cards
    give_cards
  end

  def starting_cards
    @deck.take(4).each.with_index do |card, index|
      next @player.cards << card if (index % 2).zero?
      @dealer.cards << card
    end
    @player.bank -= 10
    @dealer.bank -= 10
    @bank += 20
  end

  def sum_points
    sum = 0
    @player.cards.each do |card|
      sum += Integer(card[0]) unless card[0].to_i.zero?
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
