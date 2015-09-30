require 'rails_helper'

describe "the login/logout process" do
  # FactoryGirl Methods:
  # create()         - Make this thing, save, give it to me
  # build()          - Make this thing, give it to me
  # atrributes_for() - Give me a hash of attributes to make this thing

  let(:login_page) { LoginPageHelper.new }
  let(:user) { attributes_for(:user) }

  before :each do
    create(:user)
    login_page.visit_page.login(user)
  end

  describe 'when logged out' do
    it "signs me in" do
      expect(page).to have_content "Welcome #{user[:username]}"
    end
  end

  describe 'when logged in' do
    it 'has a log out link' do
      expect(page).to have_link 'Logout'
    end

    it 'logs me out' do
      click_link 'Logout'
      expect(page).to have_content 'So Long'
    end

    it 'has log in fields' do
      click_link 'Logout'
      expect(page).to have_field 'session_username'
      expect(page).to have_field 'session_password'
    end
  end
end
