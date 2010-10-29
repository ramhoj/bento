Given /^I am signed in as "([^"]*)"$/ do |email|
  user = User.find_by_email(email)
  sign_in(user)
end

Given /^I am logged in as admin$/ do
  user = User.make(:site => Site.make(:name => "FooSite"))
  sign_in(user)
end
