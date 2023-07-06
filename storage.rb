require 'json'
require_relative 'Method/book'
require_relative 'Method/label'

class Storage
  def save_books(books)
    book_data = books.map do |book|
      {
        'title' => book.title,
        'publish_date' => book.publish_date.to_s,
        'publisher' => book.publisher,
        'color' => book.color,
        'cover_state' => book.cover_state,
        'archived' => book.archived
      }
    end
    File.write('books.json', JSON.pretty_generate(book_data))
  end

  def save_labels(labels)
    label_data = labels.map do |label|
      {
        'id' => label.id,
        'title' => label.title,
        'color' => label.color
      }
    end

    File.write('labels.json', JSON.pretty_generate(label_data))
  end

  def load_books
    if File.exist?('books.json')
      json_data = JSON.parse(File.read('books.json'))
      books = json_data.map do |data|
        publish_date = data['publish_date'] ? Date.parse(data['publish_date']) : nil
        book = Book.new(publish_date, data['title'], data['publisher'], data['color'], data['cover_state'])
        book.archived = data['archived']
        book
      end
      books
    else
      []
    end
  end

  def load_labels
    if File.exist?('labels.json')
      json_data = File.read('labels.json')
      if json_data.empty?
        []
      else
        begin
          labels = JSON.parse(json_data).map do |data|
            Label.new(data['id'], data['title'], data['color'])
          end
          labels
        rescue JSON::ParserError => e
          puts "Error parsing JSON data: #{e.message}"
          []
        end
      end
    else
      []
    end
  end
end
