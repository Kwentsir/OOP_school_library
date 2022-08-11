require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  before(:all) do
    @student = Student.new(13, 'sara')
    @classroom = Classroom.new('class8')
  end

  context 'when classroom is created' do
    it 'should be able to add a new stdent' do
      @student.classroom = @classroom
      expect(@classroom.students.include?(@student)).to eq true
    end
    it 'return classroom lable' do
      expect(@classroom.label).to eq 'class8'
    end
  end
end
