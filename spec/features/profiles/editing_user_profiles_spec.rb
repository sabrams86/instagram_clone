require 'rails_helper'

feature 'editing user profiles' do
  background do
    user = create :user
    user_two = create(:user, id=2,
                             email="hi@hi.com",
                             user_name="fobbie")
    post = create(:post, user_id: user.id)
    post_two = create(:post, user_id: user_two.id,
                             caption: "different post yo")
    sign_in_with user
    visit '/'
  end

  scenario 'a user can change their own profile details' do
    first('.user-name' > 'a').click('Arnie')
    click_link('Edit Profile')
    attach_file('user_avatar', 'spec/files/images/avatar.jpg')
    fill_in('user_bio', with: 'Is this real life?')
    click_button 'Update Profile'

    expect(page.current_path).to eq(profile_path('Arnie'))
    expect(page).to have_css("img[src*='avatar']")
    expect(page).to have_content('Is this real life?')
  end

  scenario 'a user cannot change someone elses profile picture' do
    first('.user-name' > 'a').click('fobbie')

    expect(page).to_not have_content('Edit Profile')
  end

  scenario "a user cannot navigate directly to edit a users profile" do
    visit '/fobbie/edit'

    expect(page).to_not have_content('Change your profile image')
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("That Profile doesn't belong to you!")
  end
