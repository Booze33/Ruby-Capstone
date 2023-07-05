require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre, author, source, label, publish_date, on_spotify)
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super and @on_spotify
  end
end

# album = MusicAlbum.new('Metal', 'Acdc', 'From a friend', 'Gift', '2010-01-30', true)

# album.can_be_archived?
# album.move_to_archive

# p album
