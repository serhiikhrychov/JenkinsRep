And(/^I fill new password in '(.*)' textfield$/) do |field|
  case field
  when 'New Password'
  @optimize_hit.site_admin_edit_page.new_password_textfield. set 'tester'
  when 'Confirm Password'
  @optimize_hit.site_admin_edit_page.confirm_password_textfield. set 'tester'
  end
end

Then(/^I should see alert notification$/) do
  page.driver.browser.switch_to.alert
end

And(/^I close alert notification$/) do
  page.driver.browser.switch_to.alert.accept
end


And(/^I select '(.*)' in 'Title' dropdown list$/) do |title|
  @optimize_hit.site_admin_edit_page.select_title_in_dropdown title
end

And(/^I fill '(.*)' in '(.*)' textfield$/) do |name, field|
  if field.eql? 'First Name'
  @optimize_hit.site_admin_edit_page.first_name_field. set name
  end
  if field.eql? 'Last Name'
  @optimize_hit.site_admin_edit_page.last_name_field. set name
  end
  if field.eql? 'Roles'
  @optimize_hit.site_admin_edit_page.roles_textfield. set name
  end
  if field.eql? 'External Id'
   sleep 2
  @optimize_hit.site_admin_edit_page.external_id. set name
  end
  if field.eql? 'Pref Email'
  @optimize_hit.site_admin_edit_page.pref_email. set name
  end
  if field.eql? 'Email Address'
  @optimize_hit.site_admin_add_user_page.email_textfield. set name
  end
  if field.eql? 'Password'
  @optimize_hit.site_admin_add_user_page.password_textfield. set name
  end
  if field.eql? 'Confirm Password'
  @optimize_hit.site_admin_add_user_page.confirm_password_textfield. set name
  end
  if field.eql? 'Divisions'
  @optimize_hit.site_admin_add_user_page.divisions_textfield. set name
  end
  if field.eql? 'Once finished, send emails to'
  @optimize_hit.site_admin_assign_skills_page.once_finished_send_emails_textfield. set name
  end
end

Then(/^I should see list of suggestions$/) do
  @optimize_hit.site_admin_edit_page.suggestions_list
end

And(/^I select current item in list of suggestions$/) do
  @optimize_hit.site_admin_edit_page.suggestions_list_item.click
end

And(/^I change all data of user$/) do |table|
  table.hashes.each do |add_data_for_edit|
    title = add_data_for_edit[:title]
    first_name = add_data_for_edit[:first_name]
    last_name = add_data_for_edit[:last_name]
    roles = add_data_for_edit[:roles]
    pref_email = add_data_for_edit[:pref_email]

    @optimize_hit.site_admin_edit_page.select_title_in_dropdown (title)
    @optimize_hit.site_admin_edit_page.first_name_field.set first_name if first_name
    @optimize_hit.site_admin_edit_page.last_name_field.set last_name if last_name
    @optimize_hit.site_admin_edit_page.roles_textfield.set roles
    @optimize_hit.site_admin_edit_page.suggestions_list_item.click
    @optimize_hit.site_admin_edit_page.pref_email.set pref_email if pref_email

  end

end




