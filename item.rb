require 'date'

class Item
  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date #  user should enter a valid date [year, month, day]
    @archived = false
  end

  def can_be_archive
    date = Date.new(@publish_date)
    (Date.today - date).to_i > 3650
  end

  def move_to_archive
    if can_be_archive == true
      @archived = true
    else
      puts 'Item cannot be archived'
    end
  end
end
