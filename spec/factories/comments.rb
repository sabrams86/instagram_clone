FactoryGirl.define do
  factory :comment do
    content "Nice post!"
    user_id 1
    post_id 1
  end

end
