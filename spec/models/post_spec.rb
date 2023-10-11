require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Title', author: User.create(name: 'KOJO')) }

  describe 'Post Model title validation tests' do
    it 'should have title present' do
      subject.title = 'Title'
      expect(subject).to be_valid
    end

    it 'should not have title field empty, if then' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should be less than or equal to 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid

      subject.title = 'a' * 250
      expect(subject).to be_valid
    end

    it 'comments_counter must be an integer otherwise' do
      subject.comments_counter = 'You are not an integer'
      expect(subject).to_not be_valid
    end
  end

  describe 'Post Model method tests' do
    it 'should return five recent comments' do
      post = Post.create(title: 'Title', author: User.create(name: 'KOJO'))
      expect(post.most_recent_comments).to eq([])
    end

    it 'should update comments_counter after create' do
      post = Post.create(title: 'Title', author: User.create(name: 'KOJO'))
      result = post.update_post_counter
      expect(result).to eq(true)
    end
  end
end
