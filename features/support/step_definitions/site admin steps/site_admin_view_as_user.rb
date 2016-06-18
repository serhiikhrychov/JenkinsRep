And(/^I click on '(.*)' skill checkbox$/) do |skill|
  @optimize_hit.site_admin_view_as_user_page.click_on_skill_checkbox skill
end

And(/^I open 'View as user' mode for specific user and click on checkbox$/) do
  sleep 3
  @optimize_hit.site_admin_manager_pop_up.search_field.set 'dimas3@mailinator.com'
  @optimize_hit.site_admin_manager_pop_up.magnifier_icon.click
  sleep 3
  @optimize_hit.site_admin_manager_pop_up.click_on_link 'Actions'
  sleep 2
  @optimize_hit.site_admin_common_page.select_actions_menu_item 'View As User'
  sleep 2
  @optimize_hit.skill_pop_up.click_on_categories '25'
  @optimize_hit.site_admin_view_as_user_page.click_on_skill_checkbox '25'
end

And(/^I login as current user$/) do
  @optimize_hit.site_admin_view_as_user_page.home_link.click
  @optimize_hit.common_page.click_on_panel 'Logout'
  @optimize_hit.login_page.login_as 'dimas3@mailinator.com', 'medicine'
  sleep 3
  @optimize_hit.skill_pop_up.click_on_categories '25'
end

And(/^I open 'View as user' mode for specific user and click on several checkboxes$/) do
  sleep 3
  @optimize_hit.site_admin_manager_pop_up.search_field.set 'dimas3@mailinator.com'
  @optimize_hit.site_admin_manager_pop_up.magnifier_icon.click
  sleep 3
  @optimize_hit.site_admin_manager_pop_up.click_on_link 'Actions'
  sleep 2
  @optimize_hit.site_admin_common_page.select_actions_menu_item 'View As User'
  sleep 2
  @optimize_hit.skill_pop_up.click_on_categories 'ALL SKILLS'
  @optimize_hit.site_admin_view_as_user_page.click_on_skill_checkbox '24'
  @optimize_hit.site_admin_view_as_user_page.click_on_skill_checkbox '25'
  @optimize_hit.site_admin_view_as_user_page.click_on_skill_checkbox '26'
  @optimize_hit.site_admin_view_as_user_page.click_on_skill_checkbox 'autosurvey'
end

And(/^I login as current user and observe all skills$/) do
  @optimize_hit.site_admin_view_as_user_page.home_link.click
  @optimize_hit.common_page.click_on_panel 'Logout'
  @optimize_hit.login_page.login_as 'dimas3@mailinator.com', 'medicine'
  sleep 3
  @optimize_hit.skill_pop_up.click_on_categories 'ALL SKILLS'
end