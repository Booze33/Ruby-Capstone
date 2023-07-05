require_relative '../Method/genre'
require_relative '../Method/music_album'

class MusicAlbumOptions
  attr_accessor :music_albums

  def initialize
    @music_albums = []
  end

  def add_music_album
    puts 'Add a music album'
    puts 'Please enter the gender of the album'
    album_genre_name = gets.chomp
    album_genre = Genre.new(album_genre_name)
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
    album_genre.add_item(album) #  here we can add all the atributes
    puts album.genre.name
    @music_albums << album
    puts @music_albums
  end
end
