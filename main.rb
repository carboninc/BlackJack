# Global Settings
require_relative 'config'

# Helpers
require_relative 'core/modules/shared_helpers'
require_relative 'core/modules/menu_helpers'

# Validation
require_relative 'core/modules/validation'

# Classes
require_relative 'core/player'
require_relative 'core/dealer'
require_relative 'core/cards'
require_relative 'core/game'
require_relative 'core/menu'

# ------------------------------------

puts 'Добро пожаловать в игру Black Jack!'
puts ''
puts '----------------------------'
puts ''
puts 'Для начала игры введите свое имя'
name = gets.chomp

game = Game.new(name)
Menu.new(game).start_game
