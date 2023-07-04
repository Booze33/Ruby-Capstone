class Item
    def initialize
        @id = Random.rand(1..1000)
        @publish_date = publish_date
        @archived = false
    end

    def move_to_archive
        @archived = true
    end
end