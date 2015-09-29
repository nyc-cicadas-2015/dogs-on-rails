# This will guess the User class
FactoryGirl.define do
  factory :user do
    username Faker::Internet.email
    password Faker::Internet.password(8)
  end
end
