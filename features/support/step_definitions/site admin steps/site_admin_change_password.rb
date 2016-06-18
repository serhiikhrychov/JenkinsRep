And(/^I create new user and change his password and login with new password$/) do
  sleep 3
  @optimize_hit.site_admin_common_page.cogwheel.click
  sleep 1
  @optimize_hit.site_admin_common_page.select_cogwheel_menu_item 'Add User'
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "Last Name"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.select_site 'TestSerg'
  @optimize_hit.add_user_pop_up.click_add_user_button
  @optimize_hit.site_admin_common_page.site_admin_breadcrumbs.click
  sleep 5
  @optimize_hit.add_user_page.search_field.set unique_email('randomemail9')
  @optimize_hit.site_admin_manager_pop_up.press_enter_button
  sleep 3
  @optimize_hit.site_admin_manager_pop_up.click_on_link 'Actions'
  sleep 2
  @optimize_hit.site_admin_common_page.select_actions_menu_item 'Change Password'
  @optimize_hit.site_admin_change_pass_pop_up.find_password_field('New Password').set 'medicine1'
  @optimize_hit.site_admin_change_pass_pop_up.find_password_field('Confirm Password').set 'medicine1'
  @optimize_hit.site_admin_change_pass_pop_up.save_settings_button.click
  @optimize_hit.common_page.close_icon.click
  @optimize_hit.common_page.click_on_panel 'Logout'
  @optimize_hit.login_page.login_as unique_email('randomemail9'), 'medicine1'


end

Then(/^I should be logged in$/) do
  @optimize_hit.common_page.find_pop_up_title 'Alert'
end

And(/^I create new user and change his password and login with old password$/) do
  sleep 3
  @optimize_hit.site_admin_common_page.cogwheel.click
  sleep 1
  @optimize_hit.site_admin_common_page.select_cogwheel_menu_item 'Add User'
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "Last Name"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.select_site 'TestSerg'
  @optimize_hit.add_user_pop_up.click_add_user_button
  @optimize_hit.site_admin_common_page.site_admin_breadcrumbs.click
  sleep 5
  @optimize_hit.add_user_page.search_field.set unique_email('randomemail9')
  @optimize_hit.site_admin_manager_pop_up.press_enter_button
  sleep 3
  @optimize_hit.site_admin_manager_pop_up.click_on_link 'Actions'
  sleep 2
  @optimize_hit.site_admin_common_page.select_actions_menu_item 'Change Password'
  @optimize_hit.site_admin_change_pass_pop_up.find_password_field('New Password').set 'medicine1'
  @optimize_hit.site_admin_change_pass_pop_up.find_password_field('Confirm Password').set 'medicine1'
  @optimize_hit.site_admin_change_pass_pop_up.save_settings_button.click
  @optimize_hit.common_page.close_icon.click
  @optimize_hit.common_page.click_on_panel 'Logout'
  @optimize_hit.login_page.login_as unique_email('randomemail9'), 'medicine'
end

And(/^I click on 'Force User to reset next time they log in' checkbox and login as user$/) do
  @optimize_hit.site_admin_change_pass_pop_up.reset_password_checkbox.click
  @optimize_hit.site_admin_change_pass_pop_up.save_settings_button.click
  @optimize_hit.common_page.close_icon.click
  @optimize_hit.common_page.click_on_panel 'Logout'
  @optimize_hit.login_page.login_as 'dimas4@mailinator.com', 'medicine'
end

And(/^I create new user with skills and force him to change password:$/) do |table|
  sleep 3
  @optimize_hit.site_admin_common_page.cogwheel.click
  sleep 1
  @optimize_hit.site_admin_common_page.select_cogwheel_menu_item 'Add User'
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "Last Name"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.select_site 'TestSerg'
  @optimize_hit.add_user_pop_up.click_add_user_button
  @optimize_hit.site_admin_common_page.site_admin_breadcrumbs.click
  sleep 5
  @optimize_hit.add_user_page.search_field.set unique_email('randomemail9')
  @optimize_hit.site_admin_manager_pop_up.press_enter_button
  @optimize_hit.site_admin_manager_pop_up.checkbox.click
  sleep 3
  @optimize_hit.site_admin_common_page.cogwheel.click
  @optimize_hit.site_admin_common_page.select_cogwheel_menu_item 'Assign Skills'
  sleep 5
  table.hashes.each do |add_name|
    skill_name = add_name[:Skill_Name]
    skill_category = add_name[:Skill_category]
    skill_level = add_name[:Skill_level]
  @optimize_hit.add_user_page.check_skill skill_name, skill_category, skill_level
  @optimize_hit.site_admin_assign_skills_page.click_on_buttons 'Assign'
  page.driver.browser.switch_to.alert.accept
  @optimize_hit.site_admin_common_page.site_admin_breadcrumbs.click
  sleep 15
  @optimize_hit.site_admin_manager_pop_up.click_on_link 'Actions'
  sleep 2
  @optimize_hit.site_admin_common_page.select_actions_menu_item 'Change Password'
  @optimize_hit.site_admin_change_pass_pop_up.reset_password_checkbox.click
  @optimize_hit.site_admin_change_pass_pop_up.save_settings_button.click
  @optimize_hit.common_page.close_icon.click
  @optimize_hit.common_page.click_on_panel 'Logout'
  @optimize_hit.login_page.login_as unique_email('randomemail9'), 'medicine'
  @optimize_hit.common_page.close_icon.click
  @optimize_hit.site_admin_change_pass_pop_up.find_password_field('Old Password').set 'medicine'
  @optimize_hit.site_admin_change_pass_pop_up.find_password_field('New Password').set 'medicine1'
  @optimize_hit.site_admin_change_pass_pop_up.find_password_field('Confirm Password').set 'medicine1'
  @optimize_hit.site_admin_change_pass_pop_up.save_settings_button.click
  end
end

And(/^I create new user and change his password$/) do
  sleep 3
  @optimize_hit.site_admin_common_page.cogwheel.click
  sleep 1
  @optimize_hit.site_admin_common_page.select_cogwheel_menu_item 'Add User'
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "Last Name"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.select_site 'TestSerg'
  @optimize_hit.add_user_pop_up.click_add_user_button
  @optimize_hit.site_admin_common_page.site_admin_breadcrumbs.click
  sleep 5
  @optimize_hit.add_user_page.search_field.set unique_email('randomemail9')
  @optimize_hit.site_admin_manager_pop_up.press_enter_button
  sleep 3
  @optimize_hit.site_admin_manager_pop_up.click_on_link 'Actions'
  sleep 2
  @optimize_hit.site_admin_common_page.select_actions_menu_item 'Change Password'
  @optimize_hit.site_admin_change_pass_pop_up.reset_password_checkbox.click
  @optimize_hit.site_admin_change_pass_pop_up.save_settings_button.click
end

And(/^I fill the new password and confirm password with different data and click on 'Save Settings' button$/) do
  @optimize_hit.site_admin_change_pass_pop_up.find_password_field('New Password').set 'medicine1'
  @optimize_hit.site_admin_change_pass_pop_up.find_password_field('Confirm Password').set 'medicine123'
  @optimize_hit.site_admin_change_pass_pop_up.save_settings_button.click
end

#And(/^I fill in '(.*)' field with '(.*)'$/) do |field, data|
#  case field
#    when 'New Password'
#      @optimize_hit.site_admin_change_pass_pop_up.find_password_field('New Password').set data
#    when 'Confirm Password'
#      @optimize_hit.site_admin_change_pass_pop_up.find_password_field('Confirm Password').set data
#    when 'Search'
#      sleep 7
#      @optimize_hit.site_admin_manager_pop_up.search_field.set data
#  end
#end