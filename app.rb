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

  def load_music_albums
    @albums.load_music_albums
    @main.display_menu
  end

  def list_books
    @book_options.list_books(@books)
    @main.display_menu
  end

  def list_labels
    if @albums.empty? and @books.empty?
      puts 'No genres added yet'
    else
      puts 'Listing all labels'
      @albums.each do |label|
        puts "Name: #{label.label.title}"
      end
      @books.each do |label|
        puts "Name: #{label.label.title}"
      end
    end
  end

  def add_book
    @book_options.add_book
    @main.display_menu
  end

  def list_music_albums
    @music_albums.list_music_albums(@albums)
    @main.display_menu
  end

  def list_genres
    if @albums.empty?
      puts 'No genres added yet'
    else
      puts 'Listing all genres'
      @albums.each do |genre|
        puts "Name: #{genre.genre.name}"
      end
    end
    @main.display_menu
  end

  def add_music_album
    @music_albums.add_music_album
    @main.display_menu
  end

  def quit
    puts 'Bye!'
    p @albums
    p @books
    p @games
    exit
  end

  def add_game
    @game_options.add_game
    @main.display_menu
  end

  def list_games
    @game_options.list_games(@games)
    @main.display_menu
  end

  def list_authors
    if @albums.empty?
      puts 'No authors added yet'
    else
      puts 'Listing all authors'
      @albums.each do |author|
        puts "Name: #{author.author.first_name} #{author.author.last_name}"
      end
    end
    @main.display_menu
  end
end
