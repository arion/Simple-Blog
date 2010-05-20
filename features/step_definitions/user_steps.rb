Given /^a valid user record for (.+)$/ do |email|
  @user = User.first.update_attributes!({
                       :email => email,
                       :password => "password",
                       :password_confirmation => "password",
                       :active => true
                       })
end

Given /^I am logged in$/ do
  visit '/login'
  fill_in("user_session[email]", :with => "some_user@email.com")
  fill_in("user_session[password]", :with => "password")
  click_button("Login")
end

When /^I go on activate page$/ do
  visit "/register/#{User.last.perishable_token}"
end

