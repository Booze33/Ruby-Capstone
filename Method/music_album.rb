require_relative '../item'

class MusicAlbum < Item #  class properties: on_spotify:boolean
  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end
end