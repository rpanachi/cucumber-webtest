require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
 
# Commonly used webrat steps
# http://github.com/brynary/webrat
 
Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end
 
When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end
When /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end
 
When /^I follow "([^\"]*)"$/ do |link|
  click_link(link)
end
 
When /^I follow "([^\"]*)" within "([^\"]*)"$/ do |link, parent|
  click_link_within(parent, link)
end
 
When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end
 
When /^I fill in "([^\"]*)" for "([^\"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end
 
When /^I fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{name}" with "#{value}"}
  end
end
 
When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end
 
When /^I select "([^\"]*)" as the date and time$/ do |time|
  select_datetime(time)
end
 
When /^I select "([^\"]*)" as the "([^\"]*)" date and time$/ do |datetime, datetime_label|
  select_datetime(datetime, :from => datetime_label)
end
 
When /^I select "([^\"]*)" as the time$/ do |time|
  select_time(time)
end
 
When /^I select "([^\"]*)" as the "([^\"]*)" time$/ do |time, time_label|
  select_time(time, :from => time_label)
end
 
When /^I select "([^\"]*)" as the date$/ do |date|
  select_date(date)
end
 
When /^I select "([^\"]*)" as the "([^\"]*)" date$/ do |date, date_label|
  select_date(date, :from => date_label)
end
 
When /^I check "([^\"]*)"$/ do |field|
  check(field)
end
 
When /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field)
end
 
When /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end
 
When /^I attach the file at "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  attach_file(field, path)
end
 
Then /^I should see "([^\"]*)"$/ do |text|
  response.should contain(text)
end
 
Then /^I should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  response.should contain(regexp)
end
 
Then /^I should not see "([^\"]*)"$/ do |text|
  response.should_not contain(text)
end
 
Then /^I should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  response.should_not contain(regexp)
end
 
Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should =~ /#{value}/
end
 
Then /^the "([^\"]*)" field should not contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should_not =~ /#{value}/
end
 
Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  field_labeled(label).should be_checked
end
 
Then /^the "([^\"]*)" checkbox should not be checked$/ do |label|
  field_labeled(label).should_not be_checked
end
 
Then /^I should be on (.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end
 
Then /^show me the page$/ do
  save_and_open_page
end
