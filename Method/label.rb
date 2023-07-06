require_relative '../item'
require 'json'

class Label
  attr_reader :id, :title, :color, :items

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.labels << self
  end
end
