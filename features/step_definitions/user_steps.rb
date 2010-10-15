Given /^there is a user "([^"]*)" belonging to the account "([^"]*)"$/ do |user_email, account_name|
  account = Account.find_by_name!(account_name)
  User.make(:account => account, :email => user_email)
end