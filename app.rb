require_relative 'Options/music_albums_options'

class App
  def initialize(main)
    @main = main
    @music_albums = MusicAlbumOptions.new
  end

  def list_books
    puts 'Listing all books'
    @main.display_menu
  end

  def add_music_album
    @music_albums.add_music_album
    @main.display_menu
  end

  def quit
    puts 'Bye!'
  end
end
