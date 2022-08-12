require_relative '../student'

RSpec.describe Student do
  before(:all) do
    @student = Student.new(20, 'Ilham')
  end

  context 'When new student is created' do
    it 'Should be of Student class' do
      expect(@student.is_a?(Student)).to eq true
    end
    it 'Should play hooky' do
      expect(@student.play_hooky).to eq '¯\\(ツ)/¯'
    end
  end
end
