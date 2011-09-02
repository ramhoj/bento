Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
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

Then /^I should not see "([^"]*)"$/ do |text|
  page.should have_no_content(text)
end

Then /^I should see the header "([^\"]*)"$/ do |text|
  page.should have_css("h1, h2, caption", :text => text)
end

Then /^I should not see the header "([^\"]*)"$/ do |text|
  page.should have_no_css("h1, h2", :text => text)
end

When /^I check "([^"]*)"$/ do |value|
  page.check(value)
end

When /^I uncheck "([^"]*)"$/ do |value|
  page.uncheck(value)
end