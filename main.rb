require_relative 'app'

class Main
  def initialize
    @app = App.new(self)
    puts 'Welcome to the Ruby Catalog App'
    display_menu
  end

  def display_menu
    puts
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all movies'
    puts '4. List all games'
    puts '5. List all genres'
    puts '6. List all labels'
    puts '7. List all authors'
    puts '8. List all sources'
    puts '9. Add a book'
    puts '10. Add a music album'
    puts '11. Add a movie'
    puts '12. Add a game'
    puts '13. Exit'
    puts
    user_choice = gets.chomp
    option_selected(user_choice)
  end

  def option_selected(user_choice)
    options = {
      '1' => :list_books,
      '2' => :list_music_albums,
      '3' => :list_movies,
      '4' => :list_games,
      '5' => :list_genres,
      '6' => :list_labels,
      '7' => :list_authors,
      '8' => :list_sources,
      '9' => :add_book,
      '10' => :add_music_album,
      '11' => :add_movie,
      '12' => :add_game,
      '13' => :quit
    }

    method = options[user_choice]
    if method.nil?
      puts 'Invalid option'
      display_menu
    else
      @app.send(method)
    end
  end
end

Main.new
