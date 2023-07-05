class ItemAttributesData
  attr_accessor :genres

  def initialize
    @genres = []
  end

  def add_atributes(genre)
    @genres << genre
  end
end
