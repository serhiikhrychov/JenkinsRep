class SiteAdminManagerPopup < SitePrism::Page

  set_url 'index.jsp#siteAdmin'

  element :search_field, '.searchBox'
  element :magnifier_icon, :xpath, ".//div[@class='advancedsupport-genericAdminPanel-mainPanel']/div[2]/div[1]"
  element :x_icon_in_field, '.common-SearchBox-searchbox_closeBig'
  #if you run your tests in FF element :all_users_in_table, :xpath, "//*[@style='width: 100%; height: 100%;']/tbody/div[@title='rd@mailinator.com']"
  element :all_users_in_table, :xpath, ".//div[contains(text(), 'dr@implementhit.com')]"
  element :calendar, :xpath, "//table[@class='gwt-DatePicker']"
  element :from_date, :xpath, "//*[@class='datePickerDay']"
  element :checkbox, :xpath, ".//tr[1][@class='GK40RFKDKD']/td[1]/div/input"
  element :checked_checkbox, :xpath, ".//input[@checked='']"
  element :main_checkbox, :xpath, ".//*[@class='masterCheckBoxElement']/input"
  element :main_dropdown_button, '.arrow'
  element :main_dropdown_list, '.drop'
  element :clear_all_selection, :xpath, "//*[@class='gwt-Anchor'][contains(text(), 'Clear all selection')]"
  element :site_dropdown_button, '.gwt-ListBox'
  element :downsorting_last_name, :xpath, ".//table[contains(@style,'998')]//div[@class='gwt-Label'][contains(text(), 'Last Name')]/../..//img[@class='advancedsupport-SortWidget-sortDown'][contains(@src,'sortDownActive')]"
  element :refresh_button, '#refresh'
  element :actions_dropdown_list, '.gwt-PopupPanel'
  element :advanced_search_dropdown_button, :xpath, ".//div[@class='advancedsupport-genericAdminPanel-mainPanel']/div[2]/div[2]"
  element :search_in_advanced, '.gwt-TextBox'
  element :search_button, '.gwt-Button'
  element :created_from, :xpath, "//*[@class='gwt-Label']//../../td[2]/table/tbody/tr/td[1]/table//td[1]/input"
  element :created_to, :xpath, ".//tr[7]/td[2]/table/tbody/tr/td/table/tbody/tr/td[1]/input"


  def find_pop_up_for_site_admin(name)
    find(:xpath, "//*[@title='Site Admin Manager'][contains(text(), '#{name}')]")
  end

  def find_email_of_user(name)
    # if you run your tests in FF - find(:xpath, "//*[@style='width: 100%; height: 100%;']/tbody//div[@title='#{name}']")
    find(:xpath, ".//div[contains(text(), '#{name}')]")
  end

  def click_on_main_menu_item(name)
   find(:xpath, ".//a[contains(text(), '#{name}')]").click
  end

   def click_navigation_button(name)
    find(:xpath, "//*[@class='advancedsupport-GenericAdminPanel-pageLink'][contains(text(), '#{name}')]").click
  end

  def click_on_site_in_list(name)
    find(:xpath, ".//*[@value='#{name}']").click
  end

  def find_last_user(name)
    find(:xpath, ".//table[@class='GK40RFKDBF']/tbody[1]/tr/td[2]/div[contains(text(), '#{name}')]")
  end

  def click_on_link(name)
   find(:xpath, ".//a[contains(text(), '#{name}')]").click
        #".//*[@class='gwt-Anchor'][contains(text(), '#{name}')]").click
  end

  def click_on_first_name_sorting(name)
   find(:xpath, ".//div[2]/table/tbody/tr[1]/td[3]/table//div[@class='gwt-Label'][contains(text(), 'First Name')]/../..//img[contains  (@src,'SortUp')]").click
        #".//table[contains(@style,'998')]//div[@class='gwt-Label'][contains(text(), '#{name}')]/../..//img[@class='advancedsupport-SortWidget-sortUp'][contains  (@src,'SortUp')]").click
  end

  def click_on_last_name_sorting(name)
    find(:xpath, ".//table//div[3]//div[2]//div[contains(text(), 'Last Name')]/../..//img[contains  (@src,'#{name}')]").click
         #".//table[contains(@style,'998')]//div[@class='gwt-Label'][contains(text(), '#{name}')]/../..//img[@class='advancedsupport-SortWidget-sortDown'][contains  (@src,'SortDown')]").click
  end

  def select_role_division(name)
    find(:xpath, ".//*[@class='gwt-ListBox']/option[@value='#{name}']").click
  end

  def press_enter_button
    search_field.native.send_keys(:enter)
  end

end