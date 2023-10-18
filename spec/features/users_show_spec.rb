require 'rails_helper'

RSpec.feature 'User Show Page' do
  before(:each) do
    @user1 = User.create(name: 'Kwame', bio: 'Lives in milan', photo: 'https://www.pngegg.com/en/png-wgjix',
                         postsCounter: 0)
    @user2 = User.create(name: 'Kofi', bio: 'I am a teacher', photo: 'https://www.pngegg.com/en/png-sigeb',
                         postsCounter: 0)
    @post1 = Post.create(author: @user1, title: 'Title 1', text: 'I won')
    @post2 = Post.create(author: @user1, title: 'Title 2', text: 'I lost')
    @post3 = Post.create(author: @user1, title: 'Title 3', text: 'Draw')
    @post4 = Post.create(author: @user2, title: 'Title 4', text: 'difficult')
    @post5 = Post.create(author: @user2, title: 'Title 5', text: 'awesome')
    @post6 = Post.create(author: @user2, title: 'Title 6', text: 'Fire')
  end
  scenario 'I can see the username of the user' do
    visit user_path(@user1)

    expect(page).to have_content(@user1.name)
  end

  scenario 'I can see the profile picture for each user' do
    visit user_path(@user1)

    expect(page).to have_css('img[src*="https://www.pngegg.com/en/png-wgjix"]')
  end

  scenario 'I can see the number of posts of the user' do
    visit user_path(@user1)

    expect(page).to have_content(@user1.postsCounter)
  end

  scenario 'I can see the bio of the user' do
    visit user_path(@user1)

    expect(page).to have_content(@user1.bio)
  end

  scenario 'I can see a button to view user\'s posts' do
    visit user_path(@user1)

    expect(page).to have_content('See All Posts')
  end

  scenario 'I can see the users first 3 posts.' do
    visit user_path(@user1)

    expect(page).to have_text(@post1.title, wait: 10)
    expect(page).to have_text(@post2.title, wait: 10)
    expect(page).to have_text(@post3.title, wait: 10)
  end

  scenario 'redirects to the post show page when you click on a users post' do
    visit user_path(@user1)
    expect(page).to have_link(@post2.title)
    click_link @post2.title

    expect(current_path).to eq(user_posts_path(@user1))
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post\'s index page' do
    visit user_path(@user1)

    click_link 'See All Posts'

    expect(current_path).to eq(user_posts_path(@user1))
  end
end
