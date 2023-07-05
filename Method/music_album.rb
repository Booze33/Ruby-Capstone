require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify) # rubocop:disable Metrics/ParameterLists
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    if super and @on_spotify
      @archived = true
    end
  end
end

# music = MusicAlbum.new('2010-01-30', true)
# genre = Genre.new('Comedy')
# music.genre = genre
# music.move_to_archive
# p music
