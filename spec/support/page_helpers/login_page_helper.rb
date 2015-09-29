class LoginPageHelper
  include Capybara::DSL

  def visit_page
    visit '/'
    self
  end

  def login user
    within("#login_form") do
      fill_in 'session_username', :with => user[:username]
      fill_in 'session_password', :with => user[:password]
    end
    click_button 'Sign In'
    self
  end
end
