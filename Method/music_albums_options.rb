class MusicAlbumOptions
  attr_accessor :music_albums

  def initialize
    @music_albums = []
  end

  def add_music_album
    puts 'Enter music album name:'
  end
end
