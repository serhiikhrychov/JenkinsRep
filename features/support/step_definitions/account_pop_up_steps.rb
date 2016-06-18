When /^I edit user name using the following data$/ do |table|

  table.hashes.each do |add_name|
    first_name = add_name[:first_name]
    last_name = add_name[:last_name]

    @optimize_hit.account_pop_up.first_field.set first_name if first_name
    @optimize_hit.account_pop_up.last_field.set last_name if last_name
  end
end

And(/^I edit user last name using the following data$/) do |table|

  table.hashes.each do |add_name|
    first_name = add_name[:first_name]
    last_name = add_name[:last_name]

    @optimize_hit.account_pop_up.first_field.set first_name if first_name
    @optimize_hit.account_pop_up.last_field.set last_name if last_name
  end

end


When(/^I fill in name text field with next double name$/) do |table|

  table.hashes.each do |add_name|
    first_name = add_name[:first_name]
    last_name = add_name[:last_name]

    @optimize_hit.account_pop_up.first_field.set first_name if first_name
    @optimize_hit.account_pop_up.last_field.set last_name if last_name
  end
end

Then /^I see '(.*)' in 'First Name' text field and '(.*)' in the 'Last Name' text field$/ do |first_name, last_name|
  @optimize_hit.account_pop_up.first_field.text.should.eql? first_name
  @optimize_hit.account_pop_up.last_field.text.should.eql? last_name
end

When(/^I fill in 'Enter preferred email:' text field with '(.*)'$/) do |email|
  @optimize_hit.account_pop_up.pref_email_text_box.set email
end

Then(/^I should see '(.*)' email in 'Pref. Email' text field$/) do |email|
  @optimize_hit.account_pop_up.pref_email.text.should.eql? email
end

When(/^I delete all data from 'Pref. Email' text field$/) do
  @optimize_hit.account_pop_up.pref_email.set ''
end

When(/^I refresh the page$/) do
  page.driver.browser.navigate.refresh
  sleep 5
end

When(/^I fill in 'Old Password' text field with '(.*)'$/) do |old_pass|
  case old_pass
    when 'medicine'
      @optimize_hit.account_pop_up.old_password.set 'medicine'
    when 'medicine1'
      @optimize_hit.account_pop_up.old_password.set 'medicine1'
    when 'qwerty'
      @optimize_hit.account_pop_up.old_password.set 'qwerty'
  end
end

When(/^I fill in 'New Password' and in 'Confirm Password' text fields with '(.*)' and '(.*)'$/) do |new_password, confirm_password|
  @optimize_hit.account_pop_up.new_password.set new_password
  @optimize_hit.account_pop_up.confirm_password.set confirm_password
end


When(/^I cleared all fields$/) do
  @optimize_hit.account_pop_up.first_field.set ''
  @optimize_hit.account_pop_up.last_field.set ''
  @optimize_hit.account_pop_up.pref_email.set ''
end

When(/^I fill in 'First Name' text field with '(.*)'$/) do |data|
  case data
    when 'spaces'
      @optimize_hit.account_pop_up.first_field.set '    '
    when 'with spaces before and after valid value'
      @optimize_hit.account_pop_up.first_field.set ' test '
  end
end

When(/^I fill in 'Last Name' text field with '(.*)'$/) do |data|
  case data
    when 'spaces'
      @optimize_hit.account_pop_up.last_field.set '    '
    when 'with spaces before and after valid value'
      @optimize_hit.account_pop_up.last_field.set ' test '
  end
end

Then(/^I should see '(.*)' in '(.*)' field which was assigned to current user$/) do |name, field|
  case field
    when 'Division'
      @optimize_hit.account_pop_up.div_role_site_in_account(name)
    when 'Role'
      @optimize_hit.account_pop_up.div_role_site_in_account(name)
    when 'Site'
      @optimize_hit.account_pop_up.div_role_site_in_account(name)
  end
end

And(/^I click on 'New Password' text field$/) do
  @optimize_hit.account_pop_up.new_password.click
end

