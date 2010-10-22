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
  page.find(:xpath, "//*[self::h2 or self::h1]", :text => text).should_not be_nil
end

Then /^I should not see the header "([^\"]*)"$/ do |text|
  page.find(:xpath, "//*[self::h2 or self::h1]", :text => text).should be_nil
end
