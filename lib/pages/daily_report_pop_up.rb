class DailyReport < SitePrism::Page

  set_url '/index.jsp'


  element :close_icon, '.closeImage'
  element :add_daily_report, '.gwt-Button'
  element :today_day, :xpath, "//*[contains(@class, 'appointment')][last()]//div[contains(text(),'Patients')]"
  element :time_you_arrived_at_work, :xpath, "//div[@class='gwt-Label'][contains(text(),'Time you arrived')]/ancestor::tr[1]//select"
  element :time_you_left_work, :xpath, "//div[@class='gwt-Label'][contains(text(),'Time you left work')]/ancestor::tr[1]//select"
  element :time_spent_on_paperwork, :xpath, "//div[@class='gwt-Label'][contains(text(),'Time spent on paperwork')]/ancestor::tr[1]//select"
  element :average_time, :xpath, "//div[@class='gwt-Label'][contains(text(),'Average')]/ancestor::tr[1]//select"
  element :date_field, '.dayCellLabel-today'
  element :number_of_patients_text_box, '.gwt-TextBox'
  element :notes_for_report, '.gwt-TextArea'
  element :day_tooltip, '.gwt-HTML'
  element :previous_month_button, '.ICalButtonLeft'
  element :next_month_button, '.ICalButtonRight'
  element :day_in_calendar, '.canvas.dragdrop-dropTarget.dragdrop-boundary'
  #element :day, '.dayCellLabel'

  def data_in_day_tooltip
    find('.gwt-HTML')['Text']
  end

  def select(value, options={})
    if options.has_key?(:from)
      from = options.delete(:from)
      find(:select, from, options).find(:option, value, options).select_option
    else
      find(:option, value, options).select_option
    end
  end

  def execute_script(script)
    page.execute_script script
  end

  #def click_on_today_day
  #  page.execute_script("document.getElementsByClassName('gwt-Label')[0].click()")
  #end
end
