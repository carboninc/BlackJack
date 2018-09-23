# Game Module
module Game
  include Config
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
      run_block
    when 3
      open_cards
    else
      error_input(:run_player_menu)
    end
  end

  def run_dealer
    return open_cards if @dealer.cards.length >= 3
    pass_dealer(:run_player_menu)
    take_cards(@dealer, 1)
    puts 'Диллер взял карту'
    give_cards_menu
  end

  def open_cards
    console_separator
    end_game_menu
    who_winner
    new_game_menu
  end

  def new_game(selected)
    case selected
    when 1
      reset_game
      starting_cards
      give_cards_menu
    when 2
      abort('Всего доброго!')
    else
      error_input(:new_game_menu)
    end
  end

  private

  def starting_cards
    take_cards(@player, 2)
    take_cards(@dealer, 2)
    bets
  end

  def take_cards(someone, number_of_cards)
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

  def sum_points(someone)
    sum = 0
    someone.cards.each do |card|
      sum += @deck[card]
      if card[0] == 'A'
        next sum -= 9 if sum >= BJ || someone.points >= BJ
        sum += 1
      end
    end
    someone.points = sum
  end

  def run_block
    run_block = proc do
      return run_player(0) if @player.cards.length >= 3
      take_cards(@player, 1)
      give_cards_menu
      run_dealer
    end
    run_block.call
  end

  def who_winner
    player = @player.points
    dealer = @dealer.points
    compare_points(player, dealer)
  end
end
