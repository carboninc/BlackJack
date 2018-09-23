# Game Module
module Game
  def start_game(player)
    @player = Player.new(player)
    @dealer = Dealer.new
    @deck = Cards.new.create_deck
    @game_deck = @deck.clone
    @bank = 0
    starting_cards
    give_cards_menu(@dealer.cards.length)
  end

  def run_player(selected)
    case selected
    when 1
      run_dealer
    when 2
      take_cards(@player, 1)
      give_cards_menu(@dealer.cards.length)
      run_dealer
    when 3
      open_cards
    else
      puts 'Ошибка ввода, такого варианта нет!'
      run_player_menu
    end
  end

  def run_dealer
    return run_player_menu if @dealer.points >= 17
    take_cards(@dealer, 1)
    give_cards_menu(@dealer.cards.length)
  end

  def open_cards
    if @player.points > @dealer.points
      puts 'Вы выиграли'
      @player.bank += @bank
      new_game
    elsif @player.points < @dealer.points
      puts 'Вы проиграли'
      @dealer.bank += @bank
      new_game
    else
      puts 'Ничья'
      @player.bank += 10
      @dealer.bank += 10
      new_game
    end
  end

  def new_game
    puts 'Хотите сыграть еще раз?'
    puts '1. Да'
    puts '2. Нет'
    new_game = gets.chomp.to_i

    case new_game
    when 1
      @bank = 0
      @player.cards = []
      @dealer.cards = []
      @player.points = 0
      @dealer.points = 0
      starting_cards
      give_cards_menu(2)
    when 2
      abort('Всего доброго!')
    else
      puts 'Ошибка ввода, такого варианта нет!'
      new_game
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
        sum -= 9 if sum > 21
        sum += 1 if sum < 21
      end
    end
    someone.points = sum
  end
end
