require 'rails_helper'

feature 'Liking Posts' do
  background do
    user = create :user
    user_two = create(:user, id: 2,
                             email: 'hi@hi.com',
                             user_name: 'fobbie')
    post = create(:post, user_id: user_two.id)
    sign_in_with user
    visit '/'
  end

  scenario 'can like a post' do
    click_link 'like_1'
    expect(page).to have_css('div.liked-post')
    expect(find('.post-likers')).to have_content('Arnie')
  end

  scenario 'can unlike a post' do
    expect(page).to have_css('div.unliked-post')
    expect(find('.post-likers')).to_not have_content('Arnie')
  end
end
