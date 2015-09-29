require_relative '../rails_helper'

describe "the signin process" do
  before :each do
    User.create(username: 'test@example.com', password: '12345678')
  end

  let(:user) { User.find_by(username: 'test@example.com') }

  it "signs me in" do
    visit root_url
    within("#login_form") do
      fill_in 'session_username', :with => 'test@example.com'
      fill_in 'session_password', :with => '12345678'
    end
    click_button 'Sign In'
    expect(page).to have_content "Welcome #{user.username}"
  end
end
