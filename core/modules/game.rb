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
    @deck.keys.take(4).each.with_index do |card, index|
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
      sum += @deck[card]
      if card[0] == 'A'
        sum -= 9 if sum > 21
        sum += 1 if sum < 21
      end
    end
    @sum_points = sum
  end

  def give_cards
    puts 'Раздача карт'
    puts '----------------------------'
    puts "Карты #{@player.name}"
    puts @player.cards
    puts "Сумма очков: #{sum_points}"
    puts '----------------------------'
    puts "Карты #{@dealer.name}"
    2.times { puts '*' }
  end
end
