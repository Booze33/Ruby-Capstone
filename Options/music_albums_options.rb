require_relative '../Method/genre'
require_relative '../Method/music_album'
require 'json'

class MusicAlbumOptions
  attr_accessor :music_albums, :genres

  def initialize(item_attributes_data)
    @music_albums = []
    @genres = item_attributes_data.genres
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No music albums added yet'
    else
      puts 'Listing all music albums'
      @music_albums.each do |album|
        puts "Author: #{album.genre.name}"
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
    puts 'Please enter the gender of the album'
    album_genre_name = gets.chomp
    album_genre = Genre.new(album_genre_name)
    @genres << album_genre
    puts 'Please enter the author of the album'
    puts 'Author first name:'
    gets.chomp
    puts 'Author last name:'
    gets.chomp
    # album_author = Author.new(album_author_name, album_author_last_name)
    puts 'Enter the label title'
    gets.chomp
    puts 'Enter the label color'
    gets.chomp
    # album_source = Source.new(album_label_title, album_label_color)
    puts 'Date of publishing: year-month-day [2020-01-01]'
    album_date_of_publishing = gets.chomp
    puts 'Is the album on Spotify? [y/n]'
    album_on_spotify = gets.chomp
    album_on_spotify = album_on_spotify.upcase == 'Y'
    album = MusicAlbum.new(album_date_of_publishing, album_on_spotify)
    puts 'Album added!'
    album_genre.add_item(album) #  here we can add all the atributes of the album
    @music_albums << album
  end

  def save_music_albums
    albums_data = []
    @music_albums.each do |album|
      albums_data.push(
        publish_date: album.publish_date,
        on_spotify: album.on_spotify,
        genre: album.genre.name
      )
    end
    p albums_data
    File.write('Storage/music_albums.json', albums_data.to_json)
  end
end
