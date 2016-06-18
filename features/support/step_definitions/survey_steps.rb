When(/^I pass the survey$/) do
  @optimize_hit.common_page.click_on_answer_button 'test'
  @optimize_hit.skill_pop_up.next_button.click
  @optimize_hit.common_page.click_on_answer_button '1'
  @optimize_hit.survey_pop_up.survey_finish_button.click
  sleep 3
end

When(/^I select answer$/) do
  @optimize_hit.common_page.click_on_answer_button 'test'
end

When(/^I select another answer$/) do
  @optimize_hit.common_page.click_on_answer_button 'no'
end

Then(/^I should see '(.*)' button$/) do |button|
  if button.eql? 'Next'
  item = @optimize_hit.skill_pop_up.next_button
  item.should(be_visible)
  end
end

When(/^I open second question$/) do
  @optimize_hit.survey_pop_up.second_question_button.click
end
Then(/^I should see '(.*)' question$/) do |question|
  @optimize_hit.survey_pop_up.find_survey_question_label question
end