require 'date'

class Item
    def initialize(publish_date)
        @id = Random.rand(1..1000)
        @publish_date = publish_date #  user should enter a valid date
        @archived = false
    end

    def can_be_archive
        date = Date.new(@publish_date)
        if (Date.today - date).to_i > 3650
            true
        else
            false
        end
    end
end