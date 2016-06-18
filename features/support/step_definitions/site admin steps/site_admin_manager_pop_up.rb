Then(/^I should see '(.*)' pop up for site admin$/) do |title|
  @optimize_hit = OptimizeHit.new
  @optimize_hit.site_admin_manager_pop_up.find_pop_up_for_site_admin title
end

Then(/^I should see '(.*)' email in 'Email Address' column$/) do |email|
  @optimize_hit.site_admin_manager_pop_up.find_email_of_user email
end

Then(/^I should see '(.*)' icon$/) do |icon|
  if icon.eql? 'calendar'
    @optimize_hit.site_admin_manager_pop_up.calendar_icon
  end
  if icon.eql? 'x'
    @optimize_hit.site_admin_manager_pop_up.x_icon_in_field
  end
end

Then(/^I should see search field without any data$/) do
  @optimize_hit.site_admin_manager_pop_up.search_field
end

Then(/^I should see all users$/) do
  @optimize_hit.site_admin_manager_pop_up.all_users_in_table
end

Then(/^I should see Calendar$/) do
  @optimize_hit.site_admin_manager_pop_up.calendar
end

Then(/^I should (not)? see 'calendar'$/) do |negate|
  item = @optimize_hit.site_admin_manager_pop_up.calendar
  negate ? item.should_not(be_visible) : item.should(be_visible)
end


And(/^I select any date$/) do
  @optimize_hit.site_admin_manager_pop_up.from_date.click
end

And(/^I click on '(.*)' checkbox$/) do |checkbox|
  case checkbox
    when 'users'
      @optimize_hit.site_admin_manager_pop_up.checkbox.click
      sleep 3
    when 'main'
      sleep 5
      @optimize_hit.site_admin_manager_pop_up.main_checkbox.click
      @optimize_hit.site_admin_manager_pop_up.search_field.click
    when 'Force User to reset next time they log in'
      @optimize_hit.site_admin_edit_page.force_reset_password.click
    when 'Disable Prerequisites'
      sleep 1
      @optimize_hit.site_admin_edit_page.disable_prerequisites_checkbox.click
    when '25'
      item=@optimize_hit.site_admin_assign_skills_page.find_checkbox checkbox
      item.click
    when '26'
      item=@optimize_hit.site_admin_assign_skills_page.find_checkbox checkbox
      item.click
    when 'autosurvey'
      item=@optimize_hit.site_admin_assign_skills_page.find_checkbox checkbox
      item.click
    when 'Once finished, send emails to'
      @optimize_hit.site_admin_assign_skills_page.once_finished_send_emails_checkbox.click
    when 'Force User to reset next time they log in'
      @optimize_hit.site_admin_change_pass_pop_up.reset_password_checkbox.click
  end
end

Then(/^I should see checked checkbox$/) do
  @optimize_hit.site_admin_manager_pop_up.checked_checkbox
end

And(/^I click on any checkbox two times$/) do
  @optimize_hit.site_admin_manager_pop_up.checkbox.click
  @optimize_hit.site_admin_manager_pop_up.checked_checkbox.click
end

Then(/^I should see unmarked users checkboxes$/) do
  sleep 1
  @optimize_hit.site_admin_manager_pop_up.should have_no_selector(:xpath, ".//input[@checked='']")
end

Then(/^I should see marked users checkboxes$/) do
  @optimize_hit.site_admin_manager_pop_up.search_field.click
  @optimize_hit.site_admin_manager_pop_up.checked_checkbox
end

And(/^I click on '(.*)' dropdown button$/) do |dropdown|
  sleep 5
  case dropdown
    when 'main'
      @optimize_hit.site_admin_manager_pop_up.main_dropdown_button.click
    when 'cogwheel'
      @optimize_hit.site_admin_common_page.cogwheel.click
    when 'Category'
      @optimize_hit.site_admin_assign_skills_page.category_dropdown_button.click
    when 'Level'
      @optimize_hit.site_admin_assign_skills_page.level_dropdown_button.click
    when 'Smart Site selection'
      @optimize_hit.site_admin_unassign_skill_page.unassign_site_selection.click
  end
  sleep 3
end

Then(/^I should see '(.*)' dropdown list$/) do |dropdown_list|
  case dropdown_list
    when 'main'
      sleep 5
      @optimize_hit.site_admin_manager_pop_up.main_dropdown_list
    when 'Actions'
      @optimize_hit.site_admin_manager_pop_up.actions_dropdown_list
    when 'cogwheel'
      @optimize_hit.site_admin_common_page.cogwheel_dropdown_list
  end
end

And(/^I click on '(.*)' main menu item$/) do |menu_item|
  @optimize_hit.site_admin_manager_pop_up.click_on_main_menu_item menu_item
end

And(/^I click on '(.*)' navigation button$/) do |button|
  @optimize_hit.site_admin_manager_pop_up.click_navigation_button button
  sleep 2
end


And(/^I open '(.*)' site$/) do |site|
  @optimize_hit.site_admin_manager_pop_up.site_dropdown_button
  @optimize_hit.site_admin_manager_pop_up.click_on_site_in_list site
  sleep 5
end

And(/^I click on '(.*)' sorting button in 'First Name' column$/) do |name|
  sleep 5
  @optimize_hit.site_admin_manager_pop_up.click_on_first_name_sorting name
  sleep 3

end

Then(/^I should see '(.*)' user as first in the table$/) do |user|
  @optimize_hit.site_admin_manager_pop_up.find_last_user user
end

And(/^I click on '(.*)' sorting button in 'Last Name' column$/) do |name|
  @optimize_hit.site_admin_manager_pop_up.click_on_last_name_sorting name
  sleep 3
end

And(/^I fill in 'Search' field in advanced search with '(.*)'$/) do |email|
  @optimize_hit.site_admin_manager_pop_up.search_in_advanced.set email
end

And(/^I select '(.*)' in role dropdown list$/) do |role|
  @optimize_hit.site_admin_manager_pop_up.select_role_division role
end

And(/^I select '(.*)' in division dropdown list$/) do |division|
  @optimize_hit.site_admin_manager_pop_up.select_role_division division
end

And(/^I fill the valid date in 'Created Between' field$/) do
  @optimize_hit.site_admin_manager_pop_up.created_from.set '10/01/2014'
  @optimize_hit.site_admin_manager_pop_up.search_in_advanced.click
  @optimize_hit.site_admin_manager_pop_up.created_to.set '11/01/2014'
end

And(/^I press 'Enter' button for search field$/) do
  @optimize_hit.site_admin_manager_pop_up.press_enter_button
end