require_relative '../Method/genre'
require_relative '../Method/author'
require_relative '../Method/label'
require_relative '../Method/game'
require 'json'

class GameOptions
  attr_accessor :games

  def initialize(games)
    @games = games
  end

  def add_game
    puts 'Add a game'
    puts 'Please enter the genre of the game'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)

    puts 'Enter the game author first name'
    author_first_name = gets.chomp
    puts 'Enter the game author last name'
    author_last_name = gets.chomp
    author = Author.new(author_first_name, author_last_name)

    puts 'Enter the game title'
    label_title = gets.chomp
    puts 'Enter the label color'
    label_color = gets.chomp
    label = Label.new(Random.rand(1..1000), label_title, label_color)

    print 'Are multiplayers option available? (Y/N): '
    multiplayer_game = gets.chomp.downcase == 'y'
    print 'Please enter last_played_date (DD/MM/YYYY): '
    last_played_date = gets.chomp
    print 'Please enter game_published_date (DD/MM/YYYY): '
    released_date = gets.chomp
    game = Game.new(multiplayer_game, last_played_date, released_date)

    puts 'Game added!'

    genre.add_item(game)
    author.add_item(game)
    label.add_item(game)
    @games << game
  end

  def list_games(games)
    puts ''
    if games.empty?
      puts 'No record for game found'
    else
      puts 'List of all Games:'
      games.each do |game|
        puts '......................................................'
        puts "NAME #{game.label.title} | AUTHOR #{game.author.first_name} #{game.author.last_name}"
        puts "Multiplayer: #{game.multiplayer ? 'Yes' : 'No'} | GENRE #{game.genre.name} | COLOR #{game.label.color}"
        puts "Last Played Date: #{game.last_played_at}"
        puts "Publish Date: #{game.publish_date}"
        puts '......................................................'
        puts ''
      end
    end
  end

  def save_games
    games_data = []
    @games.each do |game|
      games_data.push(
        publish_date: game.publish_date,
        genre: game.genre.name,
        label_title: game.label.title,
        label_color: game.label.color,
        author_first_name: game.author.first_name,
        author_last_name: game.author.last_name,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at
      )
    end
    File.write('Storage/game.json', games_data.to_json)
  end

  def load_games
    return unless File.exist?('Storage/game.json')

    games_data = JSON.parse(File.read('Storage/game.json'))
    games_data.each do |game_data|
      game_genre = Genre.new(game_data['genre'])
      game_label = Label.new(Random.rand(1..1000), game_data['label_title'], game_data['label_color'])
      game_author = Author.new(game_data['author_first_name'], game_data['author_last_name'])
      game = Game.new(game_data['multiplayer'], game_data['last_played_at'], game_data['publish_date'])
      game_genre.add_item(game)
      game_label.add_item(game)
      game_author.add_item(game)
      @games << game
    end
  end
end
