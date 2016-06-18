And(/^I assign skills to user and login as current user:$/) do |table|
  @optimize_hit.site_admin_common_page.cogwheel.click
  @optimize_hit.add_user_page.assign_skills_option.click
  sleep 3
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
  @optimize_hit.login_page.login_as 'autoskilluser@mailinator.com', 'medicine'
  @optimize_hit.skill_pop_up.click_on_categories 'ALL SKILLS'
end


And(/^I unassign skills from 'autoskilluser@mailinator.com' and login:$/) do |table|
  sleep 3
  @optimize_hit.site_admin_manager_pop_up.search_field.set 'autoskilluser@mailinator.com'
  sleep 2
  @optimize_hit.site_admin_manager_pop_up.magnifier_icon.click
  sleep 3
  @optimize_hit.site_admin_manager_pop_up.checkbox.click
  @optimize_hit.site_admin_common_page.cogwheel.click
  @optimize_hit.site_admin_common_page.select_option_in_cogwheel 'Unassign Skills'
  sleep 3
  table.hashes.each do |add_name|
    skill_name = add_name[:Skill_Name]
    skill_category = add_name[:Skill_category]
    skill_level = add_name[:Skill_level]
    @optimize_hit.add_user_page.check_skill skill_name, skill_category, skill_level
  end
  @optimize_hit.site_admin_assign_skills_page.click_on_buttons 'Unassign'
  page.driver.browser.switch_to.alert.accept
  sleep 60
  @optimize_hit.common_page.close_icon.click
  @optimize_hit.common_page.click_on_panel 'Logout'
  @optimize_hit.login_page.login_as 'autoskilluser@mailinator.com', 'medicine'
end

Then(/^I should see all sites on 'unassign skills' page which were assigned to current site admin$/) do
  @optimize_hit.site_admin_unassign_skill_page.select_site_for_unassign 'SMG'
  @optimize_hit.site_admin_unassign_skill_page.select_site_for_unassign 'TestAL'
  @optimize_hit.site_admin_unassign_skill_page.select_site_for_unassign 'TestSerg'
end