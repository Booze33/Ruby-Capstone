require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return false unless super and @on_spotify

    @archived = true
  end
end

# album1 = MusicAlbum.new('2010-01-30', true)
# albumgemre = Genre.new('Comedy')
# album1gemre.add_item(album1)

# album2 = MusicAlbum.new('2010-01-30', true)
# album2gemre = Genre.new('Comedy')
# album2gemre.add_item(album2)

# p album1.genre.name
