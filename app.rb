require_relative 'storage'
require_relative 'Options/book_option'
require_relative 'Method/label'
require_relative 'Options/music_albums_options'
require_relative 'Options/item_attributes_data'
require_relative 'Options/game_option'
require 'colorize'

class App
  def initialize(main)
    @main = main
    @genres = []
    @storage = Storage.new(@genres)
    @book_options = BookOptions.new(@storage)
    @labels = @storage.load_labels
    @item_attributes_data = ItemAttributesData.new
    @games = []
    @authors = []
    retrieve_data
    @music_albums = MusicAlbumOptions.new(@item_attributes_data, @storage, @genres)
  end

  def load_music_albums
    @music_albums.load_music_albums
  end

  def list_books
    puts 'List of Books:'
    @book_options.books.each do |book|
      puts "TITLE: #{book.title.colorize(:red)},  PUBLISHED-DATE: #{book.publish_date},  ARCHIVED: #{book.archived},  COLOR: #{book.color},  COVER-STATE: #{book.cover_state},  PUBLISHER: #{book.publisher}"
    end
  end

  def list_labels
    labels = @storage.load_labels
    puts 'List of Labels:'
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
    puts 'Listing all genres:'
    genres = (@genres + @book_options.books.map { |book| book.genre&.name }).compact.uniq
    genres.each do |genre|
      if genre.is_a?(String)
        puts genre
      else
        puts genre.name || 'N/A'
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
    @music_albums.save_music_albums
    @storage.save_books(@book_options.books)
    exit
  end

  def add_game
    puts ''
    print 'Please enter author\'s first_name: '
    first_name = gets.chomp
    print 'Please enter author\'s last_name: '
    last_name = gets.chomp
    print 'Are multiplayers option available? (Y/N): '
    multiplayer_game = gets.chomp.downcase == 'y'
    print 'Please enter last_played_date (DD/MM/YYYY): '
    last_played_date = gets.chomp
    print 'Please enter game_published_date (DD/MM/YYYY): '
    released_date = gets.chomp
    game = Game.new(multiplayer_game, last_played_date, released_date)
    author = Author.new(first_name, last_name)
    author.add_item(game)
    @games << { 'id' => game.id, 'multiplayer_game' => game.multiplayer, 'last_played_date' => game.last_played_at,
                'released_date' => game.publish_date }
    @authors << { 'first_name' => game.author.first_name, 'last_name' => game.author.last_name }
    puts "\nSuccessfully added new game"
    preserve_game(@games)
    preserve_author(@authors)
  end

  def list_games
    puts ''
    if @games.empty?
      puts 'No record for game found'
    else
      puts 'List of all Games:'
      @games.each do |game|
        puts '......................................................'
        puts "Game_ID: #{game['id']}"
        puts "Multiplayer: #{game['multiplayer_game'] ? 'Yes' : 'No'}"
        puts "Last Played Date: #{game['last_played_date']}"
        puts "Publish Date: #{game['released_date']}"
        puts '......................................................'
        puts ''
      end
    end
    retrieve_data
  end

  def list_authors
    puts ''
    if @authors.empty?
      puts 'No record for authors found'
    else
      puts 'List of all Authors:'
      @authors.each_with_index do |author, _index|
        puts "Author's Name: #{author['first_name']} #{author['last_name']}"
      end
    end
    retrieve_data
  end

  def preserve_game(game)
    File.write('Storage/game.json', JSON.generate(game))
  end

  def preserve_author(author)
    File.write('Storage/author.json', JSON.generate(author))
  end

  def retrieve_data
    retrieve_game
    retrieve_author
  end

  def retrieve_game
    return unless File.exist?('Storage/game.json')

    @games = File.empty?('./Storage/game.json') ? [] : JSON.parse(File.read('Storage/game.json'))
  end

  def retrieve_author
    return unless File.exist?('Storage/author.json')

    @authors = File.empty?('./Storage/author.json') ? [] : JSON.parse(File.read('Storage/author.json'))
  end

  def to_json(param)
    {
      'id' => param.id,
      'multiplayer' => param.multiplayer,
      'last_played_at' => param.last_played_at,
      'publish_date' => param.publish_date,
      'archived' => param.archived
    }
  end
end
