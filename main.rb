# Global Settings
require_relative 'config'

# Modules
require_relative 'core/modules/menu'
require_relative 'core/modules/game'

# Classes
require_relative 'core/player'
require_relative 'core/dealer'
require_relative 'core/cards'

# ------------------------------------

# Start Here
class BlackJack
  include Config
  include Menu
  include Game
end

puts 'Добро пожаловать в игру Black Jack!'

BlackJack.new.start
