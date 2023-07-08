require_relative '../Method/genre'
require_relative '../Method/author'
require_relative '../Method/label'
require_relative '../Method/book'
require 'json'

class BookOptions
  attr_accessor :books

  def initialize(books)
    @books = books
  end

  def list_books(books)
    puts 'List of Books:'
    books.each do |book|
      puts "AUTHOR #{book.author.last_name}"
    end
    
  end

  def add_book
    puts 'Add a Book'
    puts 'Please enter the genre of the book'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)

    puts 'Enter the book author first name'
    author_first_name = gets.chomp
    puts 'Enter the book author last name'
    author_last_name = gets.chomp
    author = Author.new(author_first_name, author_last_name)

    puts 'Enter the album title'
    label_title = gets.chomp
    puts 'Enter the label color'
    label_color = gets.chomp
    label = Label.new(Random.rand(1..1000), label_title, label_color)

    puts 'Enter Published Date (YYYY-MM-DD):'
    publish_date = Date.parse(gets.chomp)

    puts 'Enter Cover State (Good/Bad):'
    cover_state = gets.chomp

    puts 'Enter Book Publisher:'
    publisher = gets.chomp

    puts 'Enter Book Color:'
    color = gets.chomp

    book = Book.new(publish_date, publisher, cover_state)

    puts 'Book Added Successfully!'

    genre.add_item(book)
    author.add_item(book)
    label.add_item(book)
    @books << book
  end
end
