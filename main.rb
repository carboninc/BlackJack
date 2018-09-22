# Global Settings
require_relative 'config'

# Modules
require_relative 'core/modules/menu'

# Classes
require_relative 'core/player'
require_relative 'core/dealer'
require_relative 'core/cards'
require_relative 'core/game'

# ------------------------------------

# Start Here
class BlackJack
  include Config
  include Menu
end

puts 'Добро пожаловать в игру Black Jack!'

BlackJack.new.start
