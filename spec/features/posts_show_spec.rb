require 'rails_helper'

RSpec.feature 'Post Show Page' do
  before(:each) do
    @user1 = User.create(name: 'user1', bio: 'I live in Bogota', photo: 'https://www.pngegg.com/en/png-wgjix',
                         postsCounter: 0)
    @user2 = User.create(name: 'User2')
    @post = Post.create(author_id: @user1.id, title: 'Hello', comments_counter: 2, likes_counter: 1, text: 'Post body')
    @comment = Comment.create(user_id: @user2.id, post_id: @post.id, text: 'my comment')
  end

  
  
  scenario 'I can see who wrote the post.' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content(@user1.name)
  end

  scenario 'I can see the post title' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content(@post.title)
  end

  scenario 'I can see how many comments it has.' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content(@post.comments_counter)
  end

  scenario 'I can see how many likes it has' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content(@post.likes_counter)
  end

  scenario 'I can see the post body' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content(@post.text)
  end

  scenario 'I can see the username of each commentor.' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content(@user2.name)
  end

  scenario 'I can see the comment each commentor left' do
    visit user_post_path(@user1, @post)
    expect(page).to have_content(@comment.text)
  end
end
