require_relative '../Method/genre'
require_relative '../Method/author'

class BookOptions
  attr_accessor :books

  def initialize(storage)
    @storage = storage
    @books = @storage.load_books
    @labels = @storage.load_labels || []
  end

  def add_book
    puts 'Enter Book Title:'
    title = gets.chomp

    puts 'Enter Published Date (YYYY-MM-DD):'
    publish_date = Date.parse(gets.chomp)

    puts 'Enter Cover State (Good/Bad):'
    cover_state = gets.chomp

    puts 'Enter Book Publisher:'
    publisher = gets.chomp

    puts 'Enter Book Color:'
    color = gets.chomp

    puts 'Enter Book Genre:'
    genre = gets.chomp

    puts 'Enter Authors first name:'
    first_name = gets.chomp

    puts 'Enter Authors Last name:'
    last_name = gets.chomp

    book = Book.new(publish_date, title, publisher, color, cover_state)
    book.genre = Genre.new(genre)
    author = Author.new(first_name, last_name)
    author.add_item(book)
    add_author(author)
    @books << book

    @storage.save_books(@books)

    label = Label.new(Random.rand(1..1000), title, color)
    label.add_item(book)
    @labels << label

    @storage.save_labels(@labels)

    puts 'Book Added Successfully!'
  end
end
