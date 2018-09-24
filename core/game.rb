# Game Class
class Game
  include Config
  include SharedHelpers
  include GameHelpers

  attr_reader :player, :dealer, :cards, :bank

  def initialize(name)
    @menu = Menu.new(self)
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

  def start_game
    starting_cards
    @menu.game_table
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
    check_open_cards
    check_pass_dealer

    take_card(@dealer)
    console_separator
    puts 'Диллер взял карту'
    @menu.game_table
  end

  def open_cards
    console_separator
    @menu.end_game
    who_winner
    @menu.new_game
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

  def check_pass_dealer
    pass_dealer = proc do
      console_separator
      puts 'Диллер пропустил ход'
      @menu.game_table
    end
    pass_dealer.call if @dealer.points >= 17
  end

  def bets
    @player.bank -= 10
    @dealer.bank -= 10
    @bank += 20
  end

  def who_winner
    player = @player.points
    dealer = @dealer.points
    compare_points(player, dealer)
  end
end
