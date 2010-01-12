require "celerity"
require "spec"

Before do
  @browser = Celerity::Browser.new(:resynchronize => true)
  @browser.javascript_enabled = true
  @host = "http://localhost:3000"
end

Dado /estou em "([^\"]*)"$/ do |site|
  @browser.goto(site)
end

E /vou para "([^\"]*)"$/ do |page|
  @browser.goto(page)
end

E /preencho o campo "([^\"]*)" com "([^\"]*)"/ do |field, value|
  @browser.text_field(:name, field).value = value
end

E /^clico no link "([^\"]*)"$/ do |link|
  click_link(link)
end

E /^clico no link "([^\"]*)" e aguardo$/ do |link|
  @browser.wait_until do |browser|
    click_link(link, browser)
    browser.wait
  end
end

E /aperto o botao "([^\"]*)"$/ do |button|
  @browser.button(:value, button).click
end

E /aperto o botao "([^\"]*)" e aguardo$/ do |button|
  @browser.wait_until do |browser|
    @browser.button(:value, button).click
    @browser.wait
  end
end

Entao /deveria ver "([^\"]*)"$/ do |text|
  @browser.text.should include(text)
end

Entao /deveria ver "([^\"]*)" no elemento "([^\"]*)"$/ do |text, element|
  @browser.text.should include(text)
end

#TODO Implementar as steps defaults

=begin

When /I follow "([^\"]*)"/ do |link|
  _link = [[:text, /^#{Regexp.escape(link)}$/], [:id, link], [:title, link]].map{|args| $browser.link(*args)}.find{|__link| __link.exist?}
  raise "link \"#{link}\" not found" unless _link
  _link.click
  assert_successful_response
end

When /I press "([^\"]*)"/ do |button|
  $browser.button(:text, button).click
  assert_successful_response
end

When /I fill in "([^\"]*)" with "([^\"]*)"/ do |field, value|
  find_by_label_or_id(:text_field, field).set(value)
end

When /I fill in "([^\"]*)" for "([^\"]*)"/ do |value, field|
  find_by_label_or_id(:text_field, field).set(value)
end

When /I check "([^\"]*)"/ do |field|
  find_by_label_or_id(:check_box, field).set(true)
end

When /^I uncheck "([^\"]*)"$/ do |field|
  find_by_label_or_id(:check_box, field).set(true)
end

When /I select "([^\"]*)" from "([^\"]*)"/ do |value, field|
  find_by_label_or_id(:select_list, field).select value
end

When /I choose "([^\"]*)"/ do |field|
  find_by_label_or_id(:radio, field).set(true)
end

When /I go to (.+)/ do |path|
  $browser.goto @host + path_to(path)
  assert_successful_response
end

When /^I wait for the AJAX call to finish$/ do
  $browser.wait_while do
    begin
      count = $browser.execute_script("window.running_ajax_calls").to_i
      count.to_i > 0
    rescue => e
      if e.message.include?('HtmlunitCorejsJavascript::Undefined')
        raise "For 'I wait for the AJAX call to finish' to work please include culerity.js after including jQuery. If you don't use jQuery please rewrite culerity.js accordingly."
      else
        raise(e)
      end
    end
  end
end

Then /I should see "([^\"]*)"/ do |text|
  # if we simply check for the browser.html content we don't find content that has been added dynamically, e.g. after an ajax call
  div = $browser.div(:text, /#{text}/)
  div.should be_exist
end

Then /I should not see "([^\"]*)"/ do |text|
  div = $browser.div(:text, /#{text}/)
  div.should_not be_exist
end

def find_by_label_or_id(element, attribute)
  matchers = [[attribute, :id], [attribute, :name]]
  matchers << [$browser.label(:text, attribute).for, :id] if $browser.label(:text, attribute).exist?
  field = matchers.map{|_field, matcher| $browser.send(element, matcher, _field)}.find(&:exist?) ||  raise("#{element} not found using  \"#{attribute}\"")
end

def assert_successful_response
  status = $browser.page.web_response.status_code
  if(status == 302 || status == 301)
    location = $browser.page.web_response.get_response_header_value('Location')
    puts "Being redirected to #{location}"
    $browser.goto location
    assert_successful_response
  elsif status != 200
    filename = "culerity-#{Time.now.to_i}.html"
    File.open(RAILS_ROOT + "/tmp/#{filename}", "w") do |f|
      f.write $browser.html
    end
    `open tmp/#{filename}`
    raise "Browser returned Response Code #{$browser.page.web_response.status_code}"
  end
end

=end

def click_link(link, browser = @browser)
  _link = [[:text, /^#{Regexp.escape(link)}$/], [:id, link], [:title, link]].map{|args| @browser.link(*args)}.find{|__link| __link.exist?}
  raise "link \"#{link}\" not found" unless _link
  _link.click
end

def find_by_label_or_id(element, attribute)
  matchers = [[attribute, :id], [attribute, :name]]
  matchers << [@browser.label(:text, attribute).for, :id] if @browser.label(:text, attribute).exist?
  field = matchers.map{|_field, matcher| @browser.send(element, matcher, _field)}.find(&:exist?) || raise("#{element} not found using  \"#{attribute}\"")
end
