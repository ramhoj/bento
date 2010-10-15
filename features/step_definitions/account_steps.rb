Given /^there is an account "([^"]*)"$/ do |name|
  Account.create!(:name => name, :email => "user@account.com", :password => "test1234")
end