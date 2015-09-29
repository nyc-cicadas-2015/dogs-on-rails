# This will guess the User class
FactoryGirl.define do
  factory :user do
    username Faker::Internet.email
    password Faker::Internet.password(8)
  end

  factory :fresh_user, class: User do
    username { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end
end
