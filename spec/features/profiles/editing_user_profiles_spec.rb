require 'rails_helper'

feature 'editing user profiles' do
  background do
    user = create :user
    user_two = create(:user, id: 2,
                             email: "hi@hi.com",
                             user_name: "fobbie")
    post_two = create(:post, user_id: user_two.id,
                             caption: "different post yo")
    post = create(:post, user_id: user.id)
    sign_in_with user
    visit '/'
  end

  scenario 'a user can change their own profile details' do
    first('.user-name').click_link('Arnie')
    click_link('Edit Profile')
    attach_file('user_avatar', 'spec/files/images/avatar.png')
    fill_in('user_bio', with: 'Is this real life?')
    click_button 'Update Profile'

    expect(page.current_path).to eq(profile_path('Arnie'))
    expect(page).to have_css("img[src*='avatar.png']")
    expect(page).to have_content('Is this real life?')
  end

  scenario 'a user cannot change someone elses profile picture' do
    second('.user-name').click_link('fobbie')

    expect(page).to_not have_content('Edit Profile')
  end

  scenario "a user cannot navigate directly to edit a users profile" do
    visit '/fobbie/edit'

    expect(page).to_not have_content('Change your profile image')
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("That Profile doesn't belong to you!")
  end
end
