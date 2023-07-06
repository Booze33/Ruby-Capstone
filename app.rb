require_relative 'Options/music_albums_options'
require_relative 'Options/item_attributes_data'

class App
  def initialize(main)
    @main = main
    @item_attributes_data = ItemAttributesData.new
    @music_albums = MusicAlbumOptions.new(@item_attributes_data)
  end

  def list_books
    puts 'Listing all books'
    @main.display_menu
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
  end
end
