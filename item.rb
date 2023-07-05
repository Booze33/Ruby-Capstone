require 'date'
require_relative 'Method/genre'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date #  user should enter a valid date [year, month, day]
    @archived = false
  end

  def can_be_archived?
    date = Date.new(@publish_date.to_i)
    (Date.today - date).to_i > 3650
  end

  def move_to_archive
    if can_be_archived? == true
      @archived = true
    else
      puts 'Item cannot be archived'
    end
  end

  def genre=(genre)
    if genre.is_a?(Genre)
      @genre = genre
      genre.items << self
    else
      puts 'Invalid genre'
    end
  end
end

# item = Item.new('2020-01-30')
# genre = Genre.new('Comedy')

# item.genre = genre

# p item.genre.name
# p genre.items
