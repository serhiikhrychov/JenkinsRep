And(/^I select skills:$/) do |table|
  table.hashes.each do |add_name|
    skill_name = add_name[:Skill_Name]
    skill_category = add_name[:Skill_category]
    skill_level = add_name[:Skill_level]
    @optimize_hit.add_user_page.check_skill skill_name, skill_category, skill_level
  end
end

And(/^I click 'Ok' in notification$/) do
  page.driver.browser.switch_to.alert.accept
end

And(/^I create user with skills and login as newly created user:$/) do |table|
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
  @optimize_hit.add_user_page.check_user unique_email('randomemail9')
  @optimize_hit.site_admin_common_page.cogwheel.click
  @optimize_hit.add_user_page.assign_skills_option.click
  table.hashes.each do |add_name|
    skill_name = add_name[:Skill_Name]
    skill_category = add_name[:Skill_category]
    skill_level = add_name[:Skill_level]
    @optimize_hit.add_user_page.check_skill skill_name, skill_category, skill_level
  end
  @optimize_hit.add_user_page.assign_skills_button.click
  page.driver.browser.switch_to.alert.accept
  sleep 60
  @optimize_hit.common_page.close_icon.click
  @optimize_hit.common_page.click_on_panel 'Logout'
  @optimize_hit.login_page.login_as unique_email('randomemail9'), 'medicine'
  @optimize_hit.common_page.close_start_guide_icon2.click
  @optimize_hit.common_page.close_start_guide_icon.click
end

And(/^I click 'Cancel' in alert notification$/) do
  page.driver.browser.switch_to.alert.dismiss
end

#Then(/^I should see skills checkboxes which were checked$/) do
# item = @optimize_hit.site_admin_assign_skills_page.find_checkbox '26'
# item.should be_checked
#end
#
#Then(/^I should see checkboxes which were unchecked$/) do
#  item = @optimize_hit.site_admin_assign_skills_page.find_checkbox '26'
#  item.should_not be_checked
#end

Then(/^I should see '(.*)' checkbox which was checked$/) do |skill|
  item = @optimize_hit.site_admin_assign_skills_page.find_checkbox skill
  item.should be_checked
end

Then(/^I should see '(.*)' checkbox which was unchecked$/) do |skill|
  item = @optimize_hit.site_admin_assign_skills_page.find_checkbox skill
  item.should_not be_checked
end

And(/^I select '(.*)' in dropdown list$/) do |name|
  @optimize_hit.site_admin_assign_skills_page.do_sorting_by name
end

Then(/^I should see '(.*)' skill as first$/) do |skill|
  @optimize_hit.site_admin_assign_skills_page.find_first_skill skill
end

And(/^I fill '(.*)' in search field$/) do |skill_name|
  @optimize_hit.site_admin_common_page.search_field_for_popup. set skill_name
end

Then(/^I should not see any skill$/) do
  page.should_not have_selector(:xpath, ".//td[contains(text(), '25')]/../td[1]//input", visible: true)
  page.should_not have_selector(:xpath, ".//td[contains(text(), '26')]/../td[1]//input", visible: true)
  page.should_not have_selector(:xpath, ".//td[contains(text(), 'autosurvey')]/../td[1]//input", visible: true)
end

Then(/^I should see all categories in dropdown list$/) do
  @optimize_hit.site_admin_assign_skills_page.find_categories '1234'
  @optimize_hit.site_admin_assign_skills_page.find_categories '24'
  @optimize_hit.site_admin_assign_skills_page.find_categories '25'
  @optimize_hit.site_admin_assign_skills_page.find_categories '26'
end

And(/^I select '(.*)' category in dropdown list$/) do |category|
  item = @optimize_hit.site_admin_assign_skills_page.find_categories category
  item.click
end

And(/^I select blank category in 'Category' dropdown list$/) do
  sleep 1
  @optimize_hit.site_admin_assign_skills_page.blank_category.click
end

Then(/^I should see all levels in dropdown list$/) do
  @optimize_hit.site_admin_assign_skills_page.find_levels '180'
  @optimize_hit.site_admin_assign_skills_page.find_levels '24'
  @optimize_hit.site_admin_assign_skills_page.find_levels '25'
  @optimize_hit.site_admin_assign_skills_page.find_levels '26'
end

And(/^I select '(.*)' level in dropdown list$/) do |level|
  item = @optimize_hit.site_admin_assign_skills_page.find_levels level
  item.click
end

And(/^I select blank level in 'Levels' dropdown list$/) do
  sleep 1
  @optimize_hit.site_admin_assign_skills_page.blank_level.click
end

Then(/^I should see email in mailbox$/) do
  Gmail.new(EnvConfig.get(:email), EnvConfig.get(:email_password)) do |gmail|
    sleep 10
    email = gmail.inbox.emails(:unread, :from => "admin@optimizehit.com").first
    email.body.should include("Dear Admin, Skills were not assigned to the selected user(s), since they were already assigned to them.")
end
end

Then(/^I should see all sites which were assigned to current site admin$/) do
  @optimize_hit.site_admin_assign_skills_page.select_site 'SMG'
  @optimize_hit.site_admin_assign_skills_page.select_site 'TestAL'
  @optimize_hit.site_admin_assign_skills_page.select_site 'TestSerg'
end

Then(/^I should see all skills which were assigned$/) do
  @optimize_hit.skill_pop_up.find_skill_title '25'
  @optimize_hit.skill_pop_up.find_skill_title '26'
  @optimize_hit.skill_pop_up.find_skill_title 'autosurvey'
end