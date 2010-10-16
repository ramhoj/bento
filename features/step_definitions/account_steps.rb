Given /^there is an account "([^"]*)"$/ do |name|
  Account.make(:name => name)
end

Given /^the account "([^"]*)" has the project "([^"]*)"$/ do |account_name, project_name|
  account = Account.find_by_name(account_name)
  Project.make(:name => project_name, :account => account)
end

When /^I fill in "([^"]*)" with the id of "([^"]*)"$/ do |field, project_name|
  project_id = Project.find_by_name(project_name)
  fill_in(field, :with => project_id)
end