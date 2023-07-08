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
      puts '......................................................'
      puts "NAME #{book.label.title} | AUTHOR #{book.author.first_name} #{book.author.last_name}"
      puts "PUBLISHER #{book.publisher} | PUBLISH DATE #{book.publish_date}"
      puts "GENRE #{book.genre.name} | COLOR #{book.label.color}"
      puts '......................................................'
      puts ''
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

    book = Book.new(publish_date, publisher, cover_state)

    puts 'Book Added Successfully!'

    genre.add_item(book)
    author.add_item(book)
    label.add_item(book)
    @books << book
  end

  def save_books
    books_data = []
    @books.each do |book|
      books_data.push(
        publish_date: book.publish_date,
        genre: book.genre.name,
        label_title: book.label.title,
        label_color: book.label.color,
        author_first_name: book.author.first_name,
        author_last_name: book.author.last_name,
        publisher: book.publisher,
        cover_state: book.cover_state
      )
    end
    File.write('Storage/books.json', books_data.to_json)
  end

  def load_books
    return unless File.exist?('Storage/books.json')

    books_data = JSON.parse(File.read('Storage/books.json'))
    books_data.each do |book_data|
      book_genre = Genre.new(book_data['genre'])
      book_label = Label.new(Random.rand(1..1000), book_data['label_title'], book_data['label_color'])
      book_author = Author.new(book_data['author_first_name'], book_data['author_last_name'])
      book = Book.new(book_data['publish_date'], book_data['publisher'], book_data['cover_state'])
      book_genre.add_item(book)
      book_label.add_item(book)
      book_author.add_item(book)
      @books << book
    end
  end
end
