require 'rails_helper'

feature 'Creating a new user' do

  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'user_user_name', with: 'sxyrailsdev'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'user_password', with: 'supersecret', match: :first
    fill_in 'user_password_confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to create an account' do
    fill_in 'user_email', with: 'sxyrailsdev@myspace.com'
    fill_in 'user_password', with: 'supersecret', match: :first
    fill_in 'user_password_confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'requires a user name to be at least 4 characters' do
    fill_in 'user_user_name', with: 'foo'
    fill_in 'user_email', with: 'sxyrailsdev@myspace.com'
    fill_in 'user_password', with: 'supersecret', match: :first
    fill_in 'user_password_confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content('minimum is 4 characters')
  end

  scenario 'requires a user name to be less than 12 characters' do
    fill_in 'user_user_name', with: 'h' * 13
    fill_in 'user_email', with: 'sxyrailsdev@myspace.com'
    fill_in 'user_password', with: 'supersecret', match: :first
    fill_in 'user_password confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("maximum is 12 characters")
  end

end
