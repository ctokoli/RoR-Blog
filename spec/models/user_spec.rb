require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom') }
  describe 'User Model Name validation tests' do
    it 'should have name present' do
      subject.name = 'Tom'
      expect(subject).to be_valid
    end

    it 'should not have name field empty' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'User counter validation ' do
    it 'posts_counter should be an integer' do
      subject.posts_counter = 8
      expect(subject).to be_valid
    end

    it 'posts_counter should be a positive number' do
      subject.posts_counter = -8
      expect(subject).to_not be_valid
    end
  end
end
