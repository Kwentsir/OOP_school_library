require_relative '../teacher'
require_relative '../book'
require_relative '../rental'

RSpec.describe Rental do
  before(:all) do
    @person = Teacher.new('Computer', 32, 'Joseph')
    @book = Book.new('The Five Love Languages', 'Gary Chapman')
    @date = '2022/08/11'
    @rental = Rental.new(@date, @person, @book)
  end

  context 'When condition date, person and book given' do
    it 'Should create a rental' do
      expect(@rental.is_a?(Rental)).to eq true
    end
    it 'Should get correct person of given person' do
      expect(@rental.person.name).to eq 'Joseph'
    end
    it 'Should get correct person of given book' do
      expect(@rental.book.title).to eq 'The Five Love Languages'
    end
    it 'Should get correct date of rental' do
      expect(@rental.date).to eq '2022/08/11'
    end
  end
end
