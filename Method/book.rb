require_relative '../item'
require 'json'
require 'date'

class Book < Item
  attr_accessor :publisher, :cover_state, :title, :color

  def initialize(published_date, title, publisher, color, cover_state)
    super(published_date)
    @title = title
    @publisher = publisher
    @color = color
    @cover_state = cover_state
    @can_be_archived = can_be_archived?
  end

  def can_be_archived?
    return false if @published_date.nil?
    (Time.now.year - @published_date.year) > 10
  end
end
