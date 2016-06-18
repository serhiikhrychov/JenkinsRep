Then(/^I should see report for current day in calendar$/) do
  @optimize_hit.daily_report_pop_up.today_day.click
end

When(/^I set mouse over the report in calendar$/) do
  @optimize_hit.daily_report_pop_up.today_day.click


end

Then(/^I see daily report tooltip$/) do
  #begin
  #  find(:css, ".gwt-HTML").click
  #  find(:xpath, "//div[@class='gwt-HTML']").click
  #rescue Selenium::WebDriver::Error::StaleElementReferenceError
  #  #just execute the next element
  #  find(:xpath, "//div[@class='gwt-HTML']").click
  #end
  page.driver.implicitlyWait(10, TimeUnit.SECONDS)
  item = @optimize_hit.daily_report_pop_up.day_tooltip
  item.should(be_visible)

end

When(/^I click on any day$/) do
@optimize_hit.daily_report_pop_up.execute_script element = page.driver.browser.find_element(:class, 'canvas')
page.driver.browser.action.move_to(element, 30, 30).perform
page.driver.browser.click.perform
end

When(/^I set mouse over the report in past$/) do
 @optimize_hit.daily_report_pop_up.day_in_calendar.click
end

Then(/^I should see corresponding notification$/) do
  page.driver.browser.switch_to.alert.text.should.eql? 'You can not create report for future date.'
end

When(/^I fill in all the fields with data:$/) do |table|
  table.hashes.each do |add_data_for_report|
    number_of_patients = add_data_for_report[:number_of_patients]
    notes = add_data_for_report[:notes]
    time_arrived = add_data_for_report[:time_arrived]
    time_you_left = add_data_for_report[:time_you_left]
    time_spent_on_paperwork = add_data_for_report[:time_spent_on_paperwork]
    average_time = add_data_for_report[:average_time]

    @optimize_hit.daily_report_pop_up.number_of_patients_text_box.set number_of_patients if number_of_patients
    @optimize_hit.daily_report_pop_up.notes_for_report.set notes if notes
    @optimize_hit.daily_report_pop_up.time_you_arrived_at_work.select(time_arrived)
    @optimize_hit.daily_report_pop_up.time_you_left_work.select(time_you_left)
    @optimize_hit.daily_report_pop_up.time_spent_on_paperwork.select(time_spent_on_paperwork)
    @optimize_hit.daily_report_pop_up.average_time.select(average_time)
  end
end

When(/^I see the following data on the tooltip:$/) do |tooltip_data|
  tooltip_data = tooltip_data.raw.flatten
  tooltip_data.each do |content|
    @optimize_hit.daily_report_pop_up.day_tooltip.should have_content(content)
  end
end

