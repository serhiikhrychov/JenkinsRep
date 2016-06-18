class Skill < SitePrism::Page

  element :search_field, '.common-SearchBox-searchboxSmall'
  element :next_button, :xpath, ".//img[contains(@src,'next')]"
  element :learn_button, :xpath, ".//img[contains(@src,'idle')]"
  element :oops_notification, :xpath, '//div[@class="common-QuizPlayer-status_label_wrong"][contains(text(), "OOPS")]'
  element :retake_now_button, :xpath, '//*[@class="gwt-Button"][contains(text(), "Retake now")]'


  def find_skill_title(name)
    find(:xpath, "//div[@class='advancedsupport-skillManger-categoryColor'][text()='#{name}']")
  end

  def click_on_categories(name)
    find(:xpath, ".//table[contains(@style,'30')]//div[@class='gwt-Label common-CalendarPanel-Cursor-Hand'][text()='#{name}']").click
  end

  def click_completed_incomplete(name)
    find(:xpath, ".//div[@class='gwt-Label common-CalendarPanel-Cursor-Hand'][text()='#{name}']").click
  end
end