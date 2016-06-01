require 'rails_helper'

feature 'Editing posts' do

  background do
    job = create(:post)
    user = create :user
    sign_in_with user

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated hombre")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end

  scenario 'Can not update without image' do
    attach_file('Image', 'spec/files/foo.txt')
    click_button 'Update Post'
    expect(page).to have_content("Something is wrong with your form!")
  end

end
