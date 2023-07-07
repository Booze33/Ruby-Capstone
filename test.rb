def add_music_album
  puts 'Add a music album'
  puts 'Please enter the genre of the album'
  album_genre_name = gets.chomp
  album_genre = @genres.find { |genre| genre.name == album_genre_name }
  album_genre ||= Genre.new(album_genre_name)
  @genres << album_genre

  # Rest of the code...
end



def load_books
  if File.exist?('Storage/books.json')
    json_data = JSON.parse(File.read('Storage/books.json'))
    json_data.map do |data|
      publish_date = data['publish_date'] ? Date.parse(data['publish_date']) : nil
      genre_name = data['genre']
      genre = @genres.find { |genre| genre.name == genre_name }
      book = Book.new(publish_date, data['title'], data['publisher'], data['color'], data['cover_state'])
      book.archived = data['archived']
      book.genre = genre
      book
    end
  else
    []
  end
end


require_relative '../Method/genre'
require_relative '../Method/music_album'
require_relative '../Method/label'
require 'json'

class MusicAlbumOptions
  attr_accessor :music_albums, :genres, :labels

  def initialize(item_attributes_data, storage, genres)
    @music_albums = []
    @genres = genres
    @storage = storage
    @labels = storage.load_labels || []
  end

  # Rest of the code...
end

======

genres = [] # Initialize the genres array

# Create an instance of the MusicAlbumOptions class
music_album_options = MusicAlbumOptions.new(item_attributes_data, storage, genres)
