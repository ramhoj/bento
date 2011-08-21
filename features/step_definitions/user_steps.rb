Given /^there is a user "([^"]*)" belonging to the account "([^"]*)"$/ do |user_email, account_name|
  account = Account.find_by_name!(account_name)
  User.make(:account => account, :email => user_email)
end

Given /^there is a user "([^"]*)" belonging to the accounts (#{LIST_REGEXP})$/ do |user_email, accounts|
  user = User.make(:email => user_email)
  accounts.each do |account_name|
    account = Account.find_by_name!(account_name)
    user.accounts << account
  end
  user.save!
end

Given "users don't respond to admin?" do
  "Nothing to see here"
end

Then /^users show respond (true|false) to admin\? should see "([^"]*)"$/ do |return_value, text|
  lambda do
    User.any_instance.stubs(:admin?).returns(return_value == "true")
    visit path_to("accounts page")
    page.should have_content(text)
  end
end