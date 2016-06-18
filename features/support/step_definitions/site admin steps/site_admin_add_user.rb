And(/^I fill all required fields$/) do
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "Last Name"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
end

Then(/^I fill all required fields and create new user and do searching by newly created user$/) do
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "Last Name"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.select_site 'TestSerg'
  @optimize_hit.add_user_pop_up.click_add_user_button
  @optimize_hit.site_admin_common_page.site_admin_breadcrumbs.click
  sleep 30
  @optimize_hit.add_user_page.search_field.set unique_email('randomemail9')
  @optimize_hit.site_admin_manager_pop_up.press_enter_button
  @optimize_hit.add_user_page.find_user unique_email('randomemail9')
end

And(/^I select '(.*)' in 'Title Name' dropdown list$/) do |title|
  @optimize_hit.site_admin_add_user_page.select_title title
end

Then(/^I should see '(.*)' in 'Title Name' dropdown button$/) do |title|
  @optimize_hit.site_admin_add_user_page.find_title title
end

Then(/^I should see '(.*)' in 'Roles' textfield$/) do |role|
 @optimize_hit.site_admin_add_user_page.find_data_in_roles_field role
end

And(/^I remove current item from textfield$/) do
  @optimize_hit.site_admin_add_user_page.remove_item_from_field.click
end

Then(/^I should see current textfield without any data$/) do
  page.should_not have_selector('.taggedX', visible: true)
end

Then(/^I should see '(.*)' in 'Divisions' textfield$/) do |division|
  @optimize_hit.site_admin_add_user_page.find_data_in_roles_field division
end


And(/^I create user with External Id and logout$/) do
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "Last Name"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.select_site 'TestSerg'
  @optimize_hit.site_admin_edit_page.external_id. set 'autodima'
  @optimize_hit.add_user_pop_up.click_add_user_button
  @optimize_hit.common_page.close_icon.click
  @optimize_hit.common_page.click_on_panel 'Logout'
end

And(/^I create user with External Id which containt only digits$/) do
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "Last Name"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.select_site 'TestSerg'
  @optimize_hit.site_admin_edit_page.external_id. set '1234'
  @optimize_hit.add_user_pop_up.click_add_user_button
end


And(/^I create user with First Name and Last Name which consist with one character$/) do
  @optimize_hit.add_user_pop_up.first_name_field.set   "F"
  @optimize_hit.add_user_pop_up.last_name_field.set    "L"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.select_site 'TestSerg'
  @optimize_hit.add_user_pop_up.click_add_user_button
end

And(/^I create user with First Name and Last Name which consist with the same data$/) do
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "First Name"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.select_site 'TestSerg'
  @optimize_hit.add_user_pop_up.click_add_user_button
end

And(/^I create user with existing email$/) do
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "Last Name"
  @optimize_hit.add_user_pop_up.email_address_field.set 'dr@implementhit.com'
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.select_site 'TestSerg'
  @optimize_hit.add_user_pop_up.click_add_user_button
end


