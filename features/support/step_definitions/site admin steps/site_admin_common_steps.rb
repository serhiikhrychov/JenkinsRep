And(/^I click on '(.*)' actions menu item$/) do |item|
  sleep 1
  @optimize_hit.site_admin_common_page.select_actions_menu_item item
  sleep 15
end

Then(/^I should see '(.*)' page for site admin$/) do |name|
  @optimize_hit.site_admin_common_page.find_title_of_page name
end

And(/^I click on '(.*)' site admin button$/) do |button|
  case button
    when 'Change'
      @optimize_hit.site_admin_common_page.change_button.click
  end

end

Then(/^I should not see 'Enter preferred email for notifications' pop up$/) do
  page.should_not have_selector('.Caption', visible: true)
end

And(/^I click on '(.*)' in bread crumbs$/) do |bread_crumbs|
  case bread_crumbs
    when 'Site Admin Manager'
      @optimize_hit.site_admin_common_page.site_admin_breadcrumbs.click
  end
end

And(/^I open '(.*)' page$/) do |page|
  case page
    when 'Add User'
      sleep 3
      @optimize_hit.site_admin_common_page.cogwheel.click
      @optimize_hit.site_admin_common_page.select_cogwheel_menu_item 'Add User'
    when 'Assign Skills'
      sleep 3
      @optimize_hit.site_admin_common_page.cogwheel.click
      @optimize_hit.site_admin_common_page.select_cogwheel_menu_item 'Assign Skills'
      sleep 5
    when 'Unassign Skills'
      sleep 4
      @optimize_hit.site_admin_common_page.cogwheel.click
      @optimize_hit.site_admin_common_page.select_option_in_cogwheel 'Unassign Skills'
      sleep 3
    when 'Manage Skills'
      sleep 3
      @optimize_hit.site_admin_manager_pop_up.click_on_link 'Actions'
      @optimize_hit.site_admin_common_page.select_actions_menu_item 'Assign Skills'
      sleep 10
  end
end

And(/^I press 'Enter' button for search field in pop up$/) do
  @optimize_hit.site_admin_common_page.press_enter_for_popup
end

And(/^I fill in '(.*)' field with '(.*)'$/) do |field, data|
  case field
    when 'New Password'
      @optimize_hit.site_admin_change_pass_pop_up.find_password_field('New Password').set data
    when 'Confirm Password'
      @optimize_hit.site_admin_change_pass_pop_up.find_password_field('Confirm Password').set data
    when 'Search'
      sleep 7
      @optimize_hit.site_admin_manager_pop_up.search_field.set data
  end
end