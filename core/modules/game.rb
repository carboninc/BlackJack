# Game Module
module Game
  def start_game(player)
    @player = Player.new(player)
    @dealer = Dealer.new
    @deck = Cards.new.create_deck
    @game_deck = @deck.clone
    @bank = 0
    starting_cards
    give_cards_menu
  end

  def run_player(selected)
    case selected
    when 1
      run_dealer
    when 2
      # Some kind of action
    when 3
      # Some kind of action
    else
      puts 'Ошибка ввода, такого варианта нет!'
      run_player_menu
    end
  end

  private

  def starting_cards
    give_cards(@player, 2)
    give_cards(@dealer, 2)
    bets
  end

  def give_cards(someone, number_of_cards)
    @game_deck.keys.take(number_of_cards).each do |card|
      someone.cards << card
      @game_deck.delete(card)
    end
  end

  def bets
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
    @player.points = sum
  end
end
