require_relative '../book'

RSpec.describe Book do
  before(:all) do
    @book = Book.new('The Five Love Languages', 'Gary Chapman')
  end
  context 'When a new book is created' do
    it 'Should create a new instance of a book' do
      expect(@book.is_a?(Book)).to eq true
    end

    it 'Should have a correct title' do
      expect(@book.title).to eq 'The Five Love Languages'
    end

    it 'Should have a correct author' do
      expect(@book.author).to eq 'Gary Chapman'
    end
  end
end
