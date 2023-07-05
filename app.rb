require_relative 'storage'
require_relative './book_option'
require_relative './Method/label'

class App
  def initialize(main)
    @main = main
    @storage = Storage.new
    @book_options = BookOptions.new(@storage)
    @labels = @storage.load_labels
  end

  def list_books
    puts "List of Books:"
    @book_options.books.each do |book|
      puts "Title: #{book.title}, Published Date: #{book.published_date}, Archived: #{book.archived}"
    end
  end

  def list_labels
    labels = @storage.load_labels
    puts "List of Labels:"
    labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
    end
  end

  def add_book
    @book_options.add_book
    @book_options.books.last.update_labels(@labels)
  end

  def quit
    @storage.save_books(@book_options.books)
    exit
  end
end
