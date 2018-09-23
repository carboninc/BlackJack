# Global Settings
require_relative 'config'

# Modules
require_relative 'core/modules/menu'
require_relative 'core/modules/game'

# Helpers
require_relative 'core/modules/helpers'

# Validation
require_relative 'core/modules/validation'

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
  include Helpers
end

puts 'Добро пожаловать в игру Black Jack!'
puts ''
puts '----------------------------'
puts ''

BlackJack.new.start
