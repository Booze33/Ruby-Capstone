require_relative 'Options/book_option'
require_relative 'Options/music_albums_options'
require_relative 'Options/game_option'
require 'colorize'

class App
  def initialize(main)
    @main = main
    @books = []
    @albums = []
    @games = []
    @music_albums = MusicAlbumOptions.new(@albums)
    @book_options = BookOptions.new(@books)
    @game_options = GameOptions.new(@games)
  end

  def list_books
    @book_options.list_books(@books)
    @main.display_menu
  end

  def list_music_albums
    @music_albums.list_music_albums(@albums)
    @main.display_menu
  end

  def list_games
    @game_options.list_games(@games)
    @main.display_menu
  end

  def list_genres
    if @albums.empty? and @books.empty? and @games.empty?
      puts 'No genres added yet'
    else
      puts 'Listing all genres'
      @albums.each do |genre|
        puts "Name: #{genre.genre.name}"
      end
      @books.each do |genre|
        puts "Name: #{genre.genre.name}"
      end
      @games.each do |genre|
        puts "Name: #{genre.genre.name}"
      end
    end
    @main.display_menu
  end

  def list_labels
    if @albums.empty? and @books.empty? and @games.empty?
      puts 'No genres added yet'
    else
      puts 'Listing all labels'
      @albums.each do |label|
        puts "Name: #{label.label.title} Color: #{label.label.color}"
      end
      @books.each do |label|
        puts "Name: #{label.label.title} Color: #{label.label.color}"
      end
      @games.each do |label|
        puts "Name: #{label.label.title} Color: #{label.label.color}"
      end
    end
  end

  def list_authors
    if @albums.empty? and @books.empty? and @games.empty?
      puts 'No authors added yet'
    else
      puts 'Listing all authors'
      @albums.each do |author|
        puts "Name: #{author.author.first_name} #{author.author.last_name}"
      end
      @books.each do |author|
        puts "Name: #{author.author.first_name} #{author.author.last_name}"
      end
      @games.each do |author|
        puts "Name: #{author.author.first_name} #{author.author.last_name}"
      end
    end
    @main.display_menu
  end

  def add_book
    @book_options.add_book
    @main.display_menu
  end

  def add_music_album
    @music_albums.add_music_album
    @main.display_menu
  end

  def add_game
    @game_options.add_game
    @main.display_menu
  end

  def quit
    puts 'Bye!'
    @music_albums.save_music_albums
    @book_options.save_books
    @game_options.save_games
    exit
  end

  def load_data
    @music_albums.load_music_albums
    @book_options.load_books
    @game_options.load_games
  end
end
