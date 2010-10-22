Given /^there is a project called "([^"]*)" belonging to the account "([^"]*)"$/ do |project_name, account_name|
  account = Account.find_by_name(account_name)
  account.projects.create!(:name => project_name)
end

When /^I (press|follow) "([^"]*)" I expect an active record not found exception$/ do |action, text|
  begin
    if action == "press" then click_button(text) else click_link(text) end
  rescue ActiveRecord::RecordNotFound
    "All good"
  end
end