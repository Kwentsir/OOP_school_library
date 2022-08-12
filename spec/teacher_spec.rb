require_relative '../teacher'

RSpec.describe Teacher do
  before(:all) do
    @teacher = Teacher.new('computer', 50, 'joseph')
  end

  context 'When new teacher is created' do
    it 'Should be of Teacher class' do
      expect(@teacher.is_a?(Teacher)).to eq true
    end
    it 'should have a specialization' do
      expect(@teacher.specialization).to eq 'computer'
    end
    it 'should always use a service' do
      expect(@teacher.can_use_services?).to eq true
    end
  end
end
