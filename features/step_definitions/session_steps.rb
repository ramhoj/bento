Given /^I am signed in as "([^"]*)"$/ do |email|
  user = User.find_by_email(email)
  sign_in(user)
end