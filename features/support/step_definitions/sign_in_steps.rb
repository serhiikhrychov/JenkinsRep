Given(/^I login with id '(.*)' and the password '(.*)'$/) do |username, password|
  @optimize_hit = OptimizeHit.new
  @optimize_hit.login_page.load
  @optimize_hit.login_page.login_as username, password
  sleep 5
end


Given(/^I am on the 'Login' page$/) do
  @optimize_hit = OptimizeHit.new
  @optimize_hit.login_page.load
end

Then(/^I should see '(.*)' page$/) do |name|
  sleep 5
  case name
    when 'Home'
      @optimize_hit.common_page.page_element
    when 'Support'
      @optimize_hit.common_page.support_page_element
    when 'Site Admin Manager'
      @optimize_hit.site_admin_common_page.site_admin_manager_page
  end
end

When(/^I click on '(.*)' link$/) do |button|
  #page.driver.browser.switch_to.alert.accept
  case button
    when 'Sign in'
      @optimize_hit.login_page.sign_in_button.click
    when 'Account'
      @optimize_hit.common_page.click_on_panel button
    when 'Report'
      @optimize_hit.common_page.click_on_panel button
    when 'Change'
      @optimize_hit.change_site_pop_up.change_site_link.click
    when 'Diagnostics'
      @optimize_hit.common_page.click_on_panel button
    when 'Logout'
      sleep 2
      @optimize_hit.common_page.click_on_panel button
      sleep 3
    when 'Admin'
      @optimize_hit.common_page.admin_link.click
      page.driver.browser.switch_to.window page.driver.browser.window_handles.last
      page.driver.browser.manage.window.maximize
  sleep 6
    when 'Clear all selection'
      @optimize_hit.site_admin_manager_pop_up.click_on_link button
    when 'Actions'
      sleep 3
    @optimize_hit.site_admin_manager_pop_up.click_on_link button
      sleep 2
    when 'Home'
     @optimize_hit.site_admin_view_as_user_page.home_link.click
  end

end


Then(/^I see '(.*)' notification$/) do |notification|
  case notification
    when 'Sorry, invalid Login ID or password'
      @optimize_hit.login_page.provide_a_valid_Login_ID.text.should.eql? notification
    when 'Please provide a valid Login ID'
      @optimize_hit.login_page.provide_a_valid_Login_ID.text.should.eql? notification
    when 'Oops'
      @optimize_hit.skill_pop_up.oops_notification.text.should.eql? notification
    when 'Please enter a valid email-id'
      @optimize_hit.forgotten_password_page.alert_notification
    when 'Prerequisites will not be applied for this user'
      @optimize_hit.site_admin_add_user_page.prerequisites_checkbox.eql? notification
  end
end


