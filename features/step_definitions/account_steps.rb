Given /^there is an account "([^"]*)"$/ do |name|
  Account.make(:name => name)
end