Given /^there is a project called "([^"]*)" belonging to the account "([^"]*)"$/ do |project_name, account_name|
  account = Account.find_by_name(account_name)
  account.projects.create!(:name => project_name)
end

When /^I press "([^"]*)" I expect an active record not found exception$/ do |button|
  begin
    click_button(button)
  rescue ActiveRecord::RecordNotFound
    "All good"
  end
end