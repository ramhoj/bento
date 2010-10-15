Given /^there is a user "([^"]*)" belonging to the account "([^"]*)"$/ do |user_email, account_name|
  account = Account.find_by_name!(account_name)
  user = User.create!(:account => account, :email => user_email, :password => "test1234", :password_confirmation => "test1234")
end