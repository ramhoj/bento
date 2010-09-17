Given /^I am on the sign up page$/ do
  visit new_account_path
end

When /^I follow "([^"]*)"$/ do |text|
  page.click_link(text)
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see form errors$/ do
  page.should have_css(".form-errors")
end