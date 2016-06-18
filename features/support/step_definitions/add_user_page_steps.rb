When(/^I click on "([^"]*)" dropdown button$/) do |dropdown|
  if (dropdown.eql? 'Cogwheel')
    @optimize_hit.add_user_page.cogwheel_dropdown_button.click
  end
end

When(/^I select '([^"]*)' menu item$/) do |menu_item|
  if (menu_item.eql? 'Add User')
    @optimize_hit.add_user_page.add_user_option.click
  end
  if (menu_item.eql? 'Assign Skills')
    @optimize_hit.add_user_page.assign_skills_option.click
  end
  if (menu_item.eql? 'Rules Based Assignment')
    @optimize_hit.add_user_page.rules_based_assignment_option.click
   end
  end

When(/^I search Email address from '([^"]*)'$/) do  |email|
  @optimize_hit.add_user_page.search_field.set unique_email(email)
  @optimize_hit.add_user_page.search_button.click
end

Then(/^I should see '([^"]*)' from email address  and "([^"]*)" role$/) do |email, role|
  page.has_xpath?(@optimize_hit.add_user_page.get_email_locator(unique_email(email)))
  page.has_xpath?(@optimize_hit.add_user_page.get_access_level_locator(unique_email(email), role))
end


