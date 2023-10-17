require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like Model Method test' do
    user = User.create(name: 'Harry', photo: 'https://www.pngegg.com/en/png-wgjix' )
    post = Post.create(title: 'Title', text: 'Text', author: user)
    puts post.inspect
    like = Like.create(user: user, post: post)

    it 'should update likes_counter after create' do
      like.updates_likes_counter
      result = post.update_post_counter
      expect(result).to eq(true)
    end
  end
end
