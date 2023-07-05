require 'json'
require_relative './Method/book'
require_relative './Method/label'

class Storage
  def save_books(books)
    File.open('books.json', 'w') do |file|
      file.write(JSON.pretty_generate(books))
    end
  end

  def load_books
    if File.exist?('books.json')
      json_data = JSON.parse(File.read('books.json'))
      books = json_data.map do |data|
        published_date = data['published_date'] ? Date.parse(data['published_date']) : nil
        book = Book.new(published_date, data['title'], data['publisher'], data['color'], data['cover_state'])
        book.archived = data['archived']
        book
      end
      books
    else
      []
    end
  end

  def save_labels(labels)
    File.open('labels.json', 'w') do |file|
      file.write(JSON.pretty_generate(labels))
    end
  end

  def load_labels
    if File.exist?('labels.json')
      json_data = JSON.parse(File.read('labels.json'))
      labels = json_data.map do |data|
        Label.new(data['id'], data['title'], data['color'])
      end
      labels
    else
      []
    end
  end
end
