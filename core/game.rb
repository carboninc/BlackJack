# Game Class
class Game
  include Config
  include SharedHelpers

  attr_reader :player, :dealer, :cards, :bank

  def initialize(name)
    @player = Player.new(name)
    @dealer = Dealer.new
    @deck = Cards.new.create_deck
    @cards = @deck.keys
    @bank = 0
  rescue RuntimeError => e
    puts "Ошибка: #{e.message}"
    console_separator
    system('ruby main.rb') # It was made out of curiosity, do not scold =)
  end

  def starting_cards
    take_cards(@player, 2)
    sum_points(@player)
    take_cards(@dealer, 2)
    sum_points(@dealer)
    bets
  end

  def run_player
    take_card(@player)
    run_dealer
  end

  def run_dealer
    take_card(@dealer)
  end

  def who_winner
    player = @player.points
    dealer = @dealer.points
    compare_points(player, dealer)
  end

  def reset_game
    check_money
    @player.reset
    @dealer.reset
    @bank = 0
    @deck = Cards.new.create_deck
    @cards = @deck.keys
  end

  private

  def take_cards(someone, number_of_cards)
    @cards.take(number_of_cards).each do |card|
      someone.cards << card
      @cards.shift
    end
  end

  def sum_points(someone)
    sum = 0
    ace = false
    someone.cards.each do |card|
      sum += @deck[card]
      ace = true if card[0] == 'A'
    end
    sum += 10 if ace == true && sum + 10 <= BJ
    someone.points = sum
  end

  def take_card(someone)
    take_cards(someone, 1)
    sum_points(someone)
  end

  def bets
    @player.bank -= BET
    @dealer.bank -= BET
    @bank += 20
  end

  def check_money
    abort('У вас не хватает денег! Приходите позже') if @player.bank.zero?
    abort('У диллера нет денег! Приходите позже') if @dealer.bank.zero?
  end

  def compare_points(player, dealer)
    if (player > dealer && player <= BJ) || dealer > BJ
      puts 'Вы выиграли'
      @player.bank += @bank
    elsif player < dealer || player > BJ
      puts 'Вы проиграли'
      @dealer.bank += @bank
    else
      puts 'Ничья'
      draw
    end
  end

  def draw
    @player.bank += BET
    @dealer.bank += BET
  end
end
