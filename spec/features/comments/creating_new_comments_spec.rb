require 'rails_helper.rb'

feature "Creating Comments" do
  background do
    user = create :user
    post = create(:post, user_id: user.id)
    sign_in_with user
  end

  scenario "users can comment on posts" do
    visit '/'
    fill_in 'comment_content_1', with: ';P'
    click_button 'Submit'
    expect(page).to have_content(';P')
  end

end
