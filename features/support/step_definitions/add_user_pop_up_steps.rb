#Then (/^I should see '(.*)' pop up'$/) do |pop_up|
#  if(pop_up.eql? 'Add User')
#    @optimize_hit.add_user_pop_up.add_user_popup_title.text.should.eql? pop_up
#  end
#end

Given(/^I am in '(.*)' pop up$/) do |pop_up|
  @optimize_hit = OptimizeHit.new
  @optimize_hit.login_page.load
  @optimize_hit.login_page.login_as 'optimizeadm@mailinator.com', 'medicine'
  @optimize_hit.common_page.click_on_panel 'Admin'
  page.driver.browser.switch_to.window
  page.driver.browser.window_handles.last
  page.driver.browser.manage.window.maximize



  if pop_up.eql? 'Add User'
  @optimize_hit.admin_page.click_add_users_button
  @optimize_hit.add_user_page.cogwheel_dropdown_button.click
  @optimize_hit.add_user_page.add_user_option.click
  end

  if pop_up.eql? 'Rules Based Assignment'
  @optimize_hit.admin_page.click_add_users_button
  @optimize_hit.add_user_page.cogwheel_dropdown_button.click
  @optimize_hit.add_user_page.rules_based_assignment_option.click
  end

  end

When(/^I fill all required fields:$/) do |table|
  table.hashes.each do |add_name|
    first_name = add_name[:First_Name]
    last_name = add_name[:Last_Name]
    email_address = add_name[:Email_address]
    password = add_name[:Password]
    confirm_password = add_name[:Confirm_password]


    @optimize_hit.add_user_pop_up.first_name_field.set first_name if first_name
    @optimize_hit.add_user_pop_up.last_name_field.set last_name   if last_name
    @optimize_hit.add_user_pop_up.email_address_field.set unique_email(email_address)  if  email_address
    @optimize_hit.add_user_pop_up.password_field.set password  if password
    @optimize_hit.add_user_pop_up.confirm_password_field.set confirm_password if confirm_password
  end
end

When(/^I select '([^"]*)' site from 'Assign Site' dropdown$/) do |site|
  @optimize_hit.add_user_pop_up.assign_site(site)
end

When(/^I close 'Add User' pop up$/) do
  @optimize_hit.add_user_pop_up.close_pop_up_button.click
  sleep 60
end

When(/^I select '([^"]*)' role from 'Access Level' dropdown$/) do |role|
  @optimize_hit.add_user_pop_up.select_role(role)
end

Then(/^I should see '(.*)' notification$/) do |notification|
  sleep 0.05
  @optimize_hit.add_user_pop_up.should have_selector(:xpath, (@optimize_hit.add_user_pop_up.get_error_notification_locator notification))
  #page.has_xpath?(@optimize_hit.add_user_pop_up.get_error_notification_locator notification)
  #.should be_true
end

When(/^I create user with '(.*)' first name and '(.*)' last name and '(.*)' email address and '(.*)' password and '(.*)' confirming password$/) do |first_name, last_name, email_address, password, confirm_password|
  @optimize_hit.add_user_pop_up.first_name_field.set first_name
  @optimize_hit.add_user_pop_up.last_name_field.set last_name
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email(email_address)
  @optimize_hit.add_user_pop_up.password_field.set password
  @optimize_hit.add_user_pop_up.confirm_password_field.set confirm_password
  @optimize_hit.add_user_pop_up.click_add_user_button
end