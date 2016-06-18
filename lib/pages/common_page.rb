class CommonPage < SitePrism::Page

    set_url '/index.jsp'

    element :page_element, '#AccountBox'
    element :close_icon, '.closeImage'
    element :site_title, :xpath, '//div[@class="gwt-Label"][contains(text(), "Test")]'
    element :finish_button, '.common-QuizPlayer-finish_button'
    element :skill_checkbox, :xpath, "//*[@type='checkbox']"
    element :help_icon, '[src="/images/helpIcon.png"]'
    element :support_page_element, '#logo>a'
    element :unmarked_rating_buttons, :xpath, ".//img[contains(@src,'StarGrey')]"
    element :marked_rating_buttons, :xpath, ".//img[contains(@src,'StarActive')]"
    element :close_button, :xpath, '//*[@class="gwt-Button"][contains(text(), "Close")]'
    element :do_not_remind_me_checkbox, :id, "gwt-uid-1"
    element :close_pop_up_button, :xpath, "//img[@src='images/popover-close.png']"
    element :close_start_guide_icon, :xpath, "(//*[@class='closeImage'])[1]"
    element :close_start_guide_icon2, :xpath, "(//*[@class='closeImage'])[2]"
    element :checkbox_sys_admin, :xpath, ".//div/input[@type='checkbox']"
    element :admin_link, '.gwt-Anchor.analytics-AnalyticPanel-Cursor-Pointer'

  def click_on_panel(name)
    find(:xpath, ".//div[text()='#{name}']").click
  end

  def click_on_submit_button(name)
    find(:xpath, "//button[contains(.,'#{name}')]").click
  end

  def skills_completed_this_week(name)
    find(:xpath, "//div[@class='leftHeader'][contains(text(),'#{name}')][not(contains (text(), '%'))]")
  end

  def find_pop_up_title(name)
    find(:xpath, "//div[@class='Caption'][contains(text(),'#{name}')]")
  end

    def click_on_answer_button(name)
      find(:xpath, "//label[text()='#{name}']").click
    end
 end

