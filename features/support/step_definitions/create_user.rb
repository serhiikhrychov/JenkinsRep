When(/^I create user with assigned skills:$/) do |table|
  @optimize_hit = OptimizeHit.new
  @optimize_hit.login_page.load
  @optimize_hit.login_page.login_as "optimizeadm@mailinator.com", "medicine"
  sleep 7
  @optimize_hit.common_page.click_on_panel "Admin"
  page.driver.browser.switch_to.window page.driver.browser.window_handles.last
  page.driver.browser.manage.window.maximize
  @optimize_hit.admin_page.click_add_users_button
  @optimize_hit.add_user_page.click_cogwheel_dropdown
  #@optimize_hit.add_user_page.cogwheel_dropdown_button.click
  @optimize_hit.add_user_page.add_user_option.click
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "Last Name"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.roles.set "role"
  @optimize_hit.add_user_pop_up.divisions.set "div"
  @optimize_hit.add_user_pop_up.click_add_user_button
  @optimize_hit.common_page.close_pop_up_button.click
  sleep 60
  @optimize_hit.add_user_page.search_field.set unique_email('randomemail9')
  @optimize_hit.add_user_page.search_button.click
  @optimize_hit.add_user_page.check_user unique_email('randomemail9')
  @optimize_hit.add_user_page.click_cogwheel_dropdown
  @optimize_hit.add_user_page.assign_sites_option.click
  @optimize_hit.add_user_page.get_site_locator('SMG').click
  @optimize_hit.add_user_page.get_site_locator('TestAL').click
  @optimize_hit.add_user_page.get_site_locator('TestSerg').click
  @optimize_hit.add_user_page.assign_skills_button.click
  page.driver.browser.switch_to.alert.accept
  @optimize_hit.add_user_page.click_cogwheel_dropdown
  @optimize_hit.add_user_page.assign_skills_option.click
  table.hashes.each do |add_name|
    skill_name = add_name[:Skill_Name]
    skill_category = add_name[:Skill_category]
    skill_level = add_name[:Skill_level]
    @optimize_hit.add_user_page.check_skill skill_name, skill_category, skill_level
  end
  @optimize_hit.add_user_page.assign_skills_button.click
  page.driver.browser.switch_to.alert.accept
  sleep 90
  page.driver.browser.close
  sleep 2
  page.driver.browser.switch_to.window page.driver.browser.window_handles.last
  @optimize_hit.common_page.click_on_panel 'Logout'
  end