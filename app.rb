require_relative 'storage'
require_relative './Options/book_option'
require_relative './Method/label'
require_relative 'Options/music_albums_options'
require_relative 'Options/item_attributes_data'


class App
  def initialize(main)
    @main = main
    @storage = Storage.new
    @book_options = BookOptions.new(@storage)
    @labels = @storage.load_labels
    @item_attributes_data = ItemAttributesData.new
    @music_albums = MusicAlbumOptions.new(@item_attributes_data)
  end

  def load_music_albums
    @music_albums.load_music_albums
  end

  def list_books
    puts "List of Books:"
    @book_options.books.each do |book|
      puts "Title: #{book.title}, Published Date: #{book.publish_date}, Archived: #{book.archived}"
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

  def list_music_albums
    @music_albums.list_music_albums
    @main.display_menu
  end

  def list_genres
    @music_albums.list_genres
    @main.display_menu
  end

  def add_music_album
    @music_albums.add_music_album
    @main.display_menu
  end

  def quit
    puts 'Bye!'
    @music_albums.save_music_albums
    @storage.save_books(@book_options.books)
    exit
  end
end
