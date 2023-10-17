require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment Model Method test' do
    user = User.create(name: 'Harry', photo: 'https://www.pngegg.com/en/png-wgjix')
    post = Post.create(title: 'Title')
    comment = Comment.create(text: 'Text', user: user, post: post)

    it 'should update comments_counter after create' do
      comment.update_comments_counter
      result = post.comments_counter
      expect(result).to eq(0)
    end

    it 'Comment should be text' do
      result = comment.text
      expect(result).to eq('Text')
    end
  end
end
