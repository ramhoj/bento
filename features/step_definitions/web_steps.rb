Given /^I am on the home page$/ do
  visit root_path
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