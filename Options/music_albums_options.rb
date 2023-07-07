require_relative '../Method/genre'
require_relative '../Method/music_album'
require_relative '../Method/label'
require 'json'

class MusicAlbumOptions
  attr_accessor :music_albums, :genres, :labels

  def initialize(item_attributes_data, storage, genres)
    @music_albums = []
    @genres = genres
 #   @genres = item_attributes_data.genres
    @storage = storage
    @labels = storage.load_labels || []
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No music albums added yet'
    else
      puts 'Listing all music albums'
      @music_albums.each do |album|
        puts "Name: #{album.label.title} / Genre #{album.genre.name}
        Date of publishing: #{album.publish_date} / On Spotify: #{album.on_spotify}"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts 'No genres added yet'
    else
      puts 'Listing all genres'
      @genres.each do |genre|
        puts genre.name
      end
    end
  end

  def add_music_album
    puts 'Add a music album'
    puts 'Please enter the genre of the album'
    album_genre_name = gets.chomp
    album_genre = @genres.find { |genre| genre.name == album_genre_name }
    album_genre ||= Genre.new(album_genre_name)
    @genres << album_genre
    puts 'Enter the album title'
    label_title = gets.chomp
    puts 'Enter the label color'
    label_color = gets.chomp
    album_label = Label.new(Random.rand(1..1000), label_title, label_color)
    @labels << album_label
    @storage.save_labels(@labels)
    puts 'Date of publishing: year-month-day [2020-01-01]'
    album_date_of_publishing = gets.chomp
    puts 'Is the album on Spotify? [y/n]'
    album_on_spotify = gets.chomp
    album_on_spotify = album_on_spotify.upcase == 'Y'
    album = MusicAlbum.new(album_date_of_publishing, album_on_spotify)
    puts 'Album added!'
    album_genre.add_item(album)
    album_label.add_item(album)
    @music_albums << album
  end

  def save_music_albums
    albums_data = []
    @music_albums.each do |album|
      albums_data.push(
        publish_date: album.publish_date,
        on_spotify: album.on_spotify,
        genre: album.genre.name,
        label_title: album.label.title,
        label_color: album.label.color
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
      album = MusicAlbum.new(album_data['publish_date'], album_data['on_spotify'])
      album_genre.add_item(album)
      album_label.add_item(album)
      @music_albums << album
      @genres << album_genre
    end
  end
end
