class BookOptions
  attr_accessor :books

  def initialize(storage)
    @storage = storage
    @books = @storage.load_books
  end

  def add_book
    puts 'Enter Book Title:'
    title = gets.chomp

    puts 'Enter Published Date (YYYY-MM-DD):'
    published_date = Date.parse(gets.chomp)

    puts 'Enter Cover State (good/bad):'
    cover_state = gets.chomp == 'good'

    puts 'Enter Publisher:'
    publisher = gets.chomp

    puts 'Enter Color:'
    color = gets.chomp

    book = Book.new(published_date, title, publisher, color, cover_state)
    @books << book

    @storage.save_books(@books)

    puts 'Book Added Successfully!'
  end
end
