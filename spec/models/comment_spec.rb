require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(name: 'Tom') }

  describe 'User Model Name validation tests' do
    it 'should have name present' do
      subject.name = 'Tom'
      expect(subject).to be_valid
    end
  end
end
