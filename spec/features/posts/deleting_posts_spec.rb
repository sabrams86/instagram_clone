require 'rails_helper.rb'

feature 'deleting posts' do
  background do
    post = create(:post, caption: 'Abs for days.')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'posts can be deleted' do
    click_link 'Delete Post'
    expect(page.current_path).to eq('/')
    expect(page).to have_content('Problem Solved! Post Deleted.')
    expect(page).to_not have_content('Abs for days.')
  end
end
