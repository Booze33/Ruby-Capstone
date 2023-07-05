require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
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
end

# item = Item.new('Rock', 'Acdc', 'From a friend', 'Gift', '2020-01-30')

# item.can_be_archived?
# item.move_to_archive
