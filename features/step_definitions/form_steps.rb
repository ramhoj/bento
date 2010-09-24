Then /^the "([^"]*)" field should have the error message "([^"]*)"$/ do |field, error_message|
  find_field(field).find(:xpath, ".//../span[@class='error']", :text => error_message).should be_true
end
