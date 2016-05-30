require 'rails_helper.rb'

feature 'User Authentication' do

  background do
    user = create :user
  end

  scenario do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content("Signed in successfully.")
    expect(page).to_not have_content("Register")
    expect(page).to have_content("Logout")
  end

end
