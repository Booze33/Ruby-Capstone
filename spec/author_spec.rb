require_relative '../Method/author'
require_relative '../item'

describe Author do
  describe '#initialize' do
    it 'author must be created' do
      author = Author.new('Nabeel', 'Ahmed')
      expect(author.first_name).to eq('Nabeel')
      expect(author.last_name).to eq('Ahmed')
      expect(author.items).to be_empty
    end
  end
end
