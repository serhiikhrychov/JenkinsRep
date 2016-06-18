Then /^I should get email to mailbox with '(.*)' link$/ do |link|
  Gmail.new(EnvConfig.get(:email), EnvConfig.get(:email_password)) do |gmail|
    sleep 5
    email = gmail.inbox.emails(:unread, :from => "notifications@thehotelcloud.com").first
    @verification_link = parse_link_from(email.body.decoded, link)
    @verification_link.should_not be_nil
  end
end

Then (/^I should see '(.*)' pop up$/) do |title|
  @optimize_hit.common_page.find_pop_up_title title
end

When (/^I click on '(.*)' button$/) do |button|
  case button
 when 'Submit'
    @optimize_hit.common_page.click_on_submit_button button
      sleep 1
 when 'Cancel'
    @optimize_hit.common_page.click_on_submit_button button
 when 'Add Daily Report'
    @optimize_hit.daily_report_pop_up.add_daily_report.click
    sleep 5
 when 'Change'
    @optimize_hit.change_site_pop_up.change_site_button.click
 when 'Survey'
    @optimize_hit.survey_pop_up.survey_button.click
 when 'Learn'
    @optimize_hit.skill_pop_up.learn_button.click
 when 'Add Users'
    @optimize_hit.admin_page.click_add_users_button
 when 'Add action'
    @optimize_hit.rules_based_assignment_pop_up.add_action_button.click
 when 'Previous Month'
    @optimize_hit.daily_report_pop_up.previous_month_button.click
 when 'Next Month'
    @optimize_hit.daily_report_pop_up.next_month_button.click
 when 'Finish'
    @optimize_hit.common_page.finish_button.click
 when 'Close'
    @optimize_hit.common_page.close_button.click
 when 'Retake now'
    @optimize_hit.skill_pop_up.retake_now_button.click
 when 'Go'
    @optimize_hit.forgotten_password_page.go_button.click
 when 'Upload New'
    @optimize_hit.account_pop_up.upload_new_button.click
 when 'Refresh'
    @optimize_hit.site_admin_manager_pop_up.refresh_button.click
 when 'Search'
   @optimize_hit.site_admin_manager_pop_up.search_button.click
 when 'Add User'
      sleep 3
   @optimize_hit.add_user_pop_up.click_add_user_button
 when 'Assign'
   @optimize_hit.site_admin_assign_skills_page.click_on_buttons 'Assign'
 when 'Select all'
   @optimize_hit.site_admin_assign_skills_page.click_on_buttons 'Select all'
 when 'Select none'
   @optimize_hit.site_admin_assign_skills_page.click_on_buttons 'Select none'
 when 'Unassign'
   @optimize_hit.site_admin_assign_skills_page.click_on_buttons 'Unassign'
 when 'Save Assignment'
   @optimize_hit.site_admin_assign_skills_page.click_on_buttons 'Save Assignment'
 when 'Save Settings'
   @optimize_hit.site_admin_change_pass_pop_up.save_settings_button.click
  end
end

When(/^I click on '(.*)' category$/) do |category|
 case category
  when '1234'
    sleep 3
  @optimize_hit.skill_pop_up.click_on_categories '1234'
  when '123'
    @optimize_hit.skill_pop_up.click_on_categories '123'
   when '24'
     @optimize_hit.skill_pop_up.click_on_categories '24'
   when '25'
     sleep 3
    @optimize_hit.skill_pop_up.click_on_categories '25'
  when '26'
    @optimize_hit.skill_pop_up.click_on_categories '26'
  when 'ALL SKILLS'
    sleep 10
    @optimize_hit.skill_pop_up.click_on_categories 'ALL SKILLS'
  when 'COMPLETED'
    @optimize_hit.skill_pop_up.click_completed_incomplete 'COMPLETED'
  when 'INCOMPLETE'
    @optimize_hit.skill_pop_up.click_completed_incomplete 'INCOMPLETE'
  end
  sleep 5
end

When(/^I click on '(.*)' icon$/) do |icon|
  case icon
  when 'Close'
    @optimize_hit.common_page.close_icon.click
  when 'Help'
    @optimize_hit.common_page.help_icon.click
    page.driver.browser.switch_to.window page.driver.browser.window_handles.last
    page.driver.browser.manage.window.maximize
  when 'Image'
    @optimize_hit.account_pop_up.image_icon.click
  when 'x'
    @optimize_hit.site_admin_manager_pop_up.x_icon_in_field.click
  when 'Advance Search'
    @optimize_hit.site_admin_manager_pop_up.advanced_search_dropdown_button.click
  when 'magnifier'
    @optimize_hit.site_admin_manager_pop_up.magnifier_icon.click
  end
end

When(/^I should see '(.*)' in statistic$/) do |number_of_skills|
  @optimize_hit.common_page.skills_completed_this_week(number_of_skills)
end

Then(/^I should see unmarked (?:checkbox|checkboxes)$/) do
  @optimize_hit.common_page.skill_checkbox.should_not be_checked
end

Then(/^I should see (?:checkbox|checkboxes) which (?:was|were) checked$/) do
  sleep 5
  @optimize_hit.common_page.skill_checkbox.should be_checked
end

Then(/^I should not see '(.*)' notification$/) do |notification|
  case notification
  when 'Oops'
    @optimize_hit.common_page.should have_no_selector(:xpath, "//div[@class='common-QuizPlayer-status_label_wrong'][contains(text(), 'OOPS')]")
  when 'Invalid First Name'
    @optimize_hit.add_user_pop_up.should have_no_selector(:xpath, (@optimize_hit.add_user_pop_up.get_error_notification_locator notification))
  when 'The assignments will take some time to show up'
  @optimize_hit.site_admin_assign_skills_page.should have_no_selector(:xpath, ".//div[@class='gwt-Label'][contains(text(), 'The assignments will take some time to show up')]")

  #item = @optimize_hit.site_admin_manager_pop_up.calendar
  #item.should_not(be_visible)
  end
end

When(/^I logged in as user with assigned skills:$/) do |table|
  @optimize_hit = OptimizeHit.new
  @optimize_hit.login_page.load
  @optimize_hit.login_page.login_as "optimizeadm@mailinator.com", "medicine"
  sleep 7
  @optimize_hit.common_page.admin_link.click
  page.driver.browser.switch_to.window page.driver.browser.window_handles.last
  page.driver.browser.manage.window.maximize
  sleep 3
  @optimize_hit.admin_page.click_add_users_button
  sleep 5
  #@optimize_hit.add_user_page.click_cogwheel_dropdown
  @optimize_hit.add_user_page.cogwheel_dropdown_button.click
  @optimize_hit.add_user_page.select_cogwheel_item 'Add User'
  @optimize_hit.add_user_pop_up.first_name_field.set   "First Name"
  @optimize_hit.add_user_pop_up.last_name_field.set    "Last Name"
  @optimize_hit.add_user_pop_up.email_address_field.set unique_email('randomemail9')
  @optimize_hit.add_user_pop_up.password_field.set   "medicine"
  @optimize_hit.add_user_pop_up.confirm_password_field.set "medicine"
  @optimize_hit.add_user_pop_up.roles.set "role"
  @optimize_hit.add_user_pop_up.divisions.set "div"
  @optimize_hit.add_user_pop_up.click_add_user_button
  @optimize_hit.common_page.close_pop_up_button.click
  sleep 8
  @optimize_hit.add_user_page.search_field.set unique_email('randomemail9')
  @optimize_hit.site_admin_manager_pop_up.press_enter_button
  #@optimize_hit.add_user_page.search_button.click
  @optimize_hit.add_user_page.find_user unique_email('randomemail9')
  @optimize_hit.common_page.checkbox_sys_admin.click
  sleep 5
  @optimize_hit.add_user_page.cogwheel_dropdown_button.click
  sleep 3
  @optimize_hit.add_user_page.select_cogwheel_item 'Assign Sites'
  @optimize_hit.add_user_page.get_site_locator('SMG').click
  @optimize_hit.add_user_page.get_site_locator('TestAL').click
  @optimize_hit.add_user_page.get_site_locator('TestSerg').click
  @optimize_hit.add_user_page.assign_skills_button.click
  page.driver.browser.switch_to.alert.accept
  sleep 3
  @optimize_hit.add_user_page.cogwheel_dropdown_button.click
  @optimize_hit.add_user_page.select_cogwheel_item 'Assign Skills'
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
  #page.driver.browser.close
  #@optimize_hit.admin_page.click_dropdown
  #@optimize_hit.admin_page.sign_out_option.click
  @optimize_hit.login_page.login_as unique_email('randomemail9'), 'medicine'
  ##@optimize_hit.common_page.do_not_remind_me_checkbox.click
  ##@optimize_hit.common_page.click_on_submit_button 'Submit'
  @optimize_hit.common_page.close_start_guide_icon2.click
  @optimize_hit.common_page.close_start_guide_icon.click
  ##@optimize_hit.common_page.close_start_guide_icon.click
  end

And(/^I see '(.*)' link$/) do |link|
  case link
  when 'Home'
   @optimize_hit.site_admin_view_as_user_page.should have_selector( :xpath, ".//*[@class= 'gwt-Anchor analytics-AnalyticPanel-Cursor-Pointer'][contains(text(), 'Home')]")
  end
end

And(/^I should not see '(.*)' link$/) do |link|
  case link
    when 'Home'
      @optimize_hit.site_admin_view_as_user_page.should have_no_selector( :xpath, ".//*[@class= 'gwt-Anchor analytics-AnalyticPanel-Cursor-Pointer'][contains(text(), 'Home')]")
  end
end