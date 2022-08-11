require_relative '../person'
RSpec.describe Person do
  before(:all) do
    @adult = Person.new(25, 'John')
    @child = Person.new(10, 'Anica', parent_permission: false)
  end

  context 'When a new person is created' do
    it 'Should create the name of the person' do
      expect(@adult.name).to eq 'John'
    end
    it 'Should not allow to use services if underage and do not have parent permission' do
      expect(@child.can_use_services?).to eq false
    end
    it 'Should have a default parent permission' do
      expect(@adult.parent_permission).to eq true
    end
  end
end
