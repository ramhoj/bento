Given /^there is a user "([^"]*)" belonging to the account "([^"]*)"$/ do |user_email, account_name|
  account = Account.find_by_name!(account_name)
  User.make(:account => account, :email => user_email)
end

Given /^users don't respond to "([^"]*)"$/ do |method|
  "Nothing to see here"
end

Given /^users respond (true|false) to "([^"]*)"$/ do |return_value, method|
  User.any_instance.stubs(method.to_sym).returns(return_value == "true")
end
