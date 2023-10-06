require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject { User.new(name: 'Tom') }

  describe 'User Model Name validation tests' do
    it 'should have name present' do
      subject.name = 'Tom'
      expect(subject).to be_valid
    end
  end
end
