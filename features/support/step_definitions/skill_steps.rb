When(/^I click on answer radiobutton$/) do
  @optimize_hit.common_page.click_on_answer_button 'test'
end

When(/^I pass the skill$/) do
  @optimize_hit.common_page.click_on_answer_button 'test'
  @optimize_hit.skill_pop_up.next_button.click
  @optimize_hit.common_page.finish_button.click
end

When(/^I select incorrect answer and click on 'Next' button$/) do
  @optimize_hit.common_page.click_on_answer_button 'no'
  @optimize_hit.skill_pop_up.next_button.click
end

When(/^I fill in 'Search' field with '(.*)' skill$/) do |skill_name|
  @optimize_hit.skill_pop_up.search_field.set skill_name
  sleep 3
end

Then(/^I should see '(.*)' skill$/) do |search_result|
  @optimize_hit.skill_pop_up.find_skill_title search_result
end

Then(/^I should see completed skills$/) do
  @optimize_hit.common_page.skill_checkbox.should be_checked
end

Then(/^I should see incomplete skills$/) do
  @optimize_hit.common_page.skill_checkbox.should_not be_checked
end


When(/^I click on 'Rating' buttons$/) do
  @optimize_hit.common_page.unmarked_rating_buttons.click
  sleep 5
end

Then(/^I see marked 'Rating' buttons$/) do
  @optimize_hit.common_page.marked_rating_buttons
end

And(/^I select correct answer$/) do
  @optimize_hit.common_page.click_on_answer_button 'test'
end

And(/^I select incorrect answer$/) do
  @optimize_hit.common_page.click_on_answer_button 'no'
end