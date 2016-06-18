
When(/^i am on the 'Add User' page with newly created user with '([^"]*)' id:$/) do   |email_address|
  @optimize_hit = OptimizeHit.new
  @optimize_hit.login_page.load #WHY ARE YOU ALWAYS LOADING LOGIN PAGE EXPLICITLY ??
  @optimize_hit.login_page.login_as "optimizeadm@mailinator.com", "medicine"
  @optimize_hit.common_page.panel "Admin"
  page.driver.browser.switch_to.window page.driver.browser.window_handles.last
  page.driver.browser.manage.window.maximize
  @optimize_hit.admin_page.click_add_users_button
  @optimize_hit.add_user_page.cogwheel_dropdown_button.click
  @optimize_hit.add_user_page.add_user_option.click
  @optimize_hit.add_user_page.first_name_field.set   "First Name"
  @optimize_hit.add_user_page.last_name_field.set    "Last Name"
  @optimize_hit.add_user_page.email_address_field.set unique_email(email_address)
  @optimize_hit.add_user_page.password_field.set   "medicine"
  @optimize_hit.add_user_page.confirm_password_field.set "medicine"
  @optimize_hit.add_user_page.assign_site "TestSerg"
  @optimize_hit.add_user_page.click_add_user_button
  @optimize_hit.add_user_page.close_pop_up_button.click
  sleep 60
end

When(/^I check user with '([^"]*)' mail$/) do  |email|
  @optimize_hit.add_user_page.check_user unique_email(email)
end

When(/^I 'Assign' these skills:$/) do |table|
  table.hashes.each do |add_name|
    skill_name = add_name[:Skill_Name]
    skill_category = add_name[:Skill_category]
    skill_level = add_name[:Skill_level]

    find(:xpath, "//td[contains(text(),'#{skill_name}')][child::span[1][text()='#{skill_category}']][child::span[2][text()='#{skill_level}']]/preceding-sibling::td//input").click
  end
  @optimize_hit.add_user_page.assign_skills_button.click
  page.driver.browser.switch_to.alert.accept
  sleep 30
end

When(/^I log out$/) do
  @optimize_hit.admin_page.login_dropdown.click
  @optimize_hit.admin_page.sign_out_option.click
end

When(/^I login as '([^"]*)' with the password '([^"]*)'$/) do |username, password|
  @optimize_hit.login_page.login_as unique_email(username), password
end