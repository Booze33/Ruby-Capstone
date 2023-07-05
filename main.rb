# require_relative './Method/book.rb'
# require_relative './Method/label.rb'
# require 'json'

# def save_books(books)
#   File.open('books.json', 'w') do |file|
#     file.write(JSON.pretty_generate(books))
#   end
# end

# def load_books
#   if File.exist?('books.json')
#     json_data = JSON.parse(File.read('books.json'))
#     books = json_data.map do |data|
#       published_date = data['published_date'] ? Date.parse(data['published_date']) : nil
#       book = Book.new(published_date, data['title'], data['publisher'], data['color'], data['cover_state'])
#       book.archived = data['archived'] 
#       book
#     end
#     books
#   else
#     []
#   end
# end

# def save_labels(labels)
#   File.open('labels.json', 'w') do |file|
#     file.write(JSON.pretty_generate(labels))
#   end
# end

# def load_labels
#   if File.exist?('labels.json')
#     json_data = JSON.parse(File.read('labels.json'))
#     labels = json_data.map do |data|
#       Label.new(data['id'], data['title'], data['color'])
#     end
#     labels
#   else
#     []
#   end
# end

# def list_books(books)
#   puts "List of Books:"
#   books.each do |book|
#     puts "Title: #{book.title}, Published Date: #{book.published_date}, Archived: #{book.archived}"
#   end
# end

# def list_labels(labels)
#   puts "List of Labels:"
#   labels.each do |label|
#     puts "Title: #{label.title}, Color: #{label.color}"
#   end
# end

# def add_book(books)
#   puts "Enter Book Title"
#   title = gets.chomp

#   puts "Enter Published Date (YYYY-MM-DD)"
#   published_date = Date.parse(gets.chomp)

#   puts "Enter Cover State (good/bad)"
#   cover_state = gets.chomp == "good" ? true : false

#   puts "Enter Publisher"
#   publisher = gets.chomp

#   puts "Enter Color"
#   color = gets.chomp

#   book = Book.new(published_date, title, publisher, color, cover_state)
#   book.title = title

#   books << book
#   save_books(books)

#   puts "Book Added Successfully!"
# end

# def main_menu
#   books = load_books
#   labels = load_labels

#   loop do
#     puts 'Please choose an option by entering a number:'
#     puts '1. List all books'
#     puts '2. List all labels'
#     puts '3. List all music albums'
#     puts '4. List all movies'
#     puts '5. List all games'
#     puts '6. List all genres'
#     puts '7. List all authors'
#     puts '8. List all sources'
#     puts '9. Add book'
#     puts '10. Add a music album'
#     puts '11. Add a movie'
#     puts '12. Add a game'
#     puts '13. Exit'

#     choice = gets.chomp.to_i

#     case choice
#     when 1
#       list_books(books)
#     when 2
#       list_labels(labels)
#     when 9
#       add_book(books)
#     when 13
#       save_books(books)
#       save_labels(labels)
#       break
#     else
#       puts "Invalid choice. Try again"
#     end
#   end
# end

# main_menu

require_relative 'app'

class Main
  def initialize
    @app = App.new(self)
    puts 'Welcome to the Catalog App'
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
