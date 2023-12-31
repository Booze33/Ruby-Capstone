require_relative '../Method/genre'
require_relative '../Method/author'
require_relative '../Method/label'
require_relative '../Method/music_album'
require 'json'

class MusicAlbumOptions
  attr_accessor :albums

  def initialize(albums)
    @albums = albums
  end

  def list_music_albums(albums)
    if albums.empty?
      puts 'No music albums added yet'
    else
      puts 'Listing all music albums'
      albums.each do |album|
        puts '......................................................'
        puts "NAME #{album.label.title} | AUTHOR #{album.author.first_name} #{album.author.last_name}"
        puts "GENRE #{album.genre.name} | COLOR #{album.label.color} | ON SPOTIFY #{album.on_spotify}"
        puts "PUBLISH DATE #{album.publish_date}"
        puts '......................................................'
        puts ''
      end
    end
  end

  def add_music_album
    puts 'Add a music album'
    puts 'Please enter the genre of the album'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)

    puts 'Enter the album author first name'
    author_first_name = gets.chomp
    puts 'Enter the album author last name'
    author_last_name = gets.chomp
    author = Author.new(author_first_name, author_last_name)

    puts 'Enter the album title'
    label_title = gets.chomp
    puts 'Enter the label color'
    label_color = gets.chomp
    label = Label.new(Random.rand(1..1000), label_title, label_color)

    puts 'Date of publishing: year-month-day [2020-01-01]'
    date_of_publishing = gets.chomp
    puts 'Is the album on Spotify? [y/n]'
    album_on_spotify = gets.chomp
    album_on_spotify = album_on_spotify.upcase == 'Y'
    album = MusicAlbum.new(date_of_publishing, album_on_spotify)

    puts 'Album added!'

    genre.add_item(album)
    author.add_item(album)
    label.add_item(album)
    @albums << album
  end

  def save_music_albums
    albums_data = []
    @albums.each do |album|
      albums_data.push(
        publish_date: album.publish_date,
        genre: album.genre.name,
        label_title: album.label.title,
        label_color: album.label.color,
        author_first_name: album.author.first_name,
        author_last_name: album.author.last_name,
        on_spotify: album.on_spotify
      )
    end
    File.write('Storage/music_albums.json', albums_data.to_json)
  end

  def load_music_albums
    return unless File.exist?('Storage/music_albums.json')

    albums_data = JSON.parse(File.read('Storage/music_albums.json'))
    albums_data.each do |album_data|
      album_genre = Genre.new(album_data['genre'])
      album_label = Label.new(Random.rand(1..1000), album_data['label_title'], album_data['label_color'])
      album_author = Author.new(album_data['author_first_name'], album_data['author_last_name'])
      album = MusicAlbum.new(album_data['publish_date'], album_data['on_spotify'])
      album_genre.add_item(album)
      album_label.add_item(album)
      album_author.add_item(album)
      @albums << album
    end
  end
end
