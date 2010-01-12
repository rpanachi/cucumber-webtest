# Commonly used webrat steps
# http://github.com/brynary/webrat

=begin 

Dado /^que estou em "([^\"]*)"$/ do |site|
  visit site
end
 
E /^vou para "([^\"]*)"$/ do |pagina|
  visit pagina
end

E /^aperto o botao "([^\"]*)"$/ do |botao|
  click_button(botao)
end

E /^clico no link "([^\"]*)"$/ do |link|
  click_link(link)
end
 
When /^I follow "([^\"]*)" within "([^\"]*)"$/ do |link, parent|
  click_link_within(parent, link)
end
 
E /^preencho o campo "([^\"]*)" com "([^\"]*)"$/ do |campo, valor|
  fill_in(campo, :with => valor)
end
 
E /^preencho os campos:$/ do |campos|
  campos.rows_hash.each do |campo, valor|
    E %{eu preencho o campo "#{campo}" com "#{valor}"}
  end
end
 
E /^seleciono "([^\"]*)" de "([^\"]*)"$/ do |valor, campo|
  select(valor, :from => campo)
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
 
E /^checo o campo "([^\"]*)"$/ do |campo|
  check(campo)
end
 
E /^nao checo o campo "([^\"]*)"$/ do |campo|
  uncheck(campo)
end
 
When /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end
 
When /^I attach the file at "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  attach_file(field, path)
end

Entao /^deveria ver "([^\"]*)"$/ do |texto|
  response.should contain(texto)
end
 
Entao /^deveria ver \/([^\/]*)\/$/ do |regexp|
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
 
Entao /^o campo "([^\"]*)" deveria conter "([^\"]*)"$/ do |campo, valor|
  field_labeled(campo).value.should =~ /#{valor}/
end
 
Entao /^o campo "([^\"]*)" nao deveria conter "([^\"]*)"$/ do |campo, valor|
  field_labeled(campo).value.should_not =~ /#{valor}/
end
 
Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  field_labeled(label).should be_checked
end
 
Then /^the "([^\"]*)" checkbox should not be checked$/ do |label|
  field_labeled(label).should_not be_checked
end
 
Entao /^eu deveria estar na pagina (.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end
 
Then /^show me the page$/ do
  save_and_open_page
end

=end
