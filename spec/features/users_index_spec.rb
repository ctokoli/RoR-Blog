require 'rails_helper'

RSpec.feature 'User Index Page' do
  before do
    @user1 = User.create(name: 'Kwame', photo: 'https://www.pngegg.com/en/png-wgjix')
    @user2 = User.create(name: 'Kogi', photo: 'https://www.pngegg.com/en/png-sigeb')
    @user3 = User.create(name: 'Noah', photo: 'https://www.pngegg.com/en/png-bsdir')
    @user4 = User.create(name: 'Badu', photo: 'https://www.pngegg.com/en/png-bntxq')
    @user5 = User.create(name: 'Paso', photo: 'https://www.pngegg.com/en/png-bnagx')
  end

  scenario 'I can see the username of all other users.' do
    visit users_path

    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end

  scenario 'I can see the profile picture for each user.' do
    visit users_path

    expect(page).to have_selector('img[src="https://www.pngegg.com/en/png-wgjix"]')
    expect(page).to have_selector('img[src="https://www.pngegg.com/en/png-sigeb"]')
    expect(page).to have_selector('img[src="https://www.pngegg.com/en/png-bntxq"]')
  end

  scenario 'I can see the number of posts each user has written.' do
    user1 = User.find_by(name: 'Kwame')
    user2 = User.find_by(name: 'Kogi')
    Post.create(author: user1, title: 'First Post', text: 'I am Kwame')
    Post.create(author: user2, title: 'Second Post', text: 'My name is Kogi')
    visit users_path

    expect(page).to have_content(user1.postsCounter)
    expect(page).to have_content(user2.postsCounter)
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    visit users_path
    user5 = User.find_by(name: 'Paso')
    click_link user5.name
    expect(current_path).to eq(user_path(user5))
  end
end
