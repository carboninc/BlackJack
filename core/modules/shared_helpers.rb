# Shared Helpers
module SharedHelpers
  private

  # Errors
  def error_input(return_route)
    error_input = proc do
      puts 'Ошибка ввода, такого варианта нет!'
      console_separator
      send(return_route)
    end
    error_input.call
  end
  # ------------------------------------------------------

  # Others
  def console_separator
    puts ''
    puts '----------------------------'
    puts ''
  end
  # ------------------------------------------------------
end
