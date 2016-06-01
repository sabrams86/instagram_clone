require 'rails_helper.rb'

feature 'User Authentication' do

  background do
    user = create(:user)
  end

  scenario 'can log in from the index' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'

    expect(page).to have_content("Signed in successfully.")
    expect(page).to_not have_content("Register")
    expect(page).to have_content("Logout")
  end

  scenario 'can log out once logged in' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'

    click_link 'Logout'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'cannot view index posts without logging in' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page.current_path).to have_content('users/sign_in')
  end

  scenario ' cannot create a new post without logging in' do
    visit 'posts/new'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
    expect(page.current_path).to have_content('users/sign_in')
  end

end
