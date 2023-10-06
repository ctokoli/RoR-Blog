require 'rails_helper'

RSpec.describe Like, type: :model do
    describe 'Like Model Method test' do

        user = User.create(name: 'Harry')
        post = Post.create(title: 'Title', author: user)
        like = Like.create(user:user, post:post)

        it 'should update likes_counter after create' do
          like.update_post_like_count
          result = post.likes_counter
          expect(result).to eq(0)
        end
      end
end
