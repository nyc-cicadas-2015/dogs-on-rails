require_relative '../rails_helper'

describe "the signin process" do
  before :each do
    # factory girl
    create(:user)
  end

  let(:user) { attributes_for(:user) }

  it "signs me in" do
    visit root_url
    within("#login_form") do
      fill_in 'session_username', :with => user[:username]
      fill_in 'session_password', :with => user[:password]
    end
    click_button 'Sign In'
    expect(page).to have_content "Welcome #{user[:username]}"
  end
end
