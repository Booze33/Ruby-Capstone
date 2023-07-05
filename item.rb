require 'date'

class Item
  attr_accessor :published_date, :archived

  def initialize(published_date)
    @id = Random.rand(1..1000)
    @published_date = published_date #  user should enter a valid date [year, month, day]
    @archived = false
  end

  def can_be_archived?
    (Time.now.year - @published_date.year) > 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    else
      puts 'Item cannot be archived'
    end
  end
end
