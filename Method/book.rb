require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, can_be_archive

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @can_be_archive = can_be_archive?
  end

  def can_be_archive?
    super || cover_state == "bad"
  end
end
