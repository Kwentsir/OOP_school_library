require_relative '../base_decorator'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'
require_relative '../person'

RSpec.describe BaseDecorator do
  context 'When testing decorator classes' do
    it 'Should return a capitalized string' do
      person = Person.new(30, 'Arij')
      capitalized = CapitalizeDecorator.new(person)
      expect(capitalized.correct_name).to eq 'Arij'
    end

    it 'Should trim a string to 10 characters' do
      person = Person.new(45, 'HarryPotter')
      trimmed = TrimmerDecorator.new(person)
      expect(trimmed.correct_name).to eq 'HarryPotte'
    end
  end
end
