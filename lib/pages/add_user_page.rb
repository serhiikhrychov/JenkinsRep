class AddUserPage < SitePrism::Page

  set_url '/admin.jsp#/physician/add'

  element :cogwheel_dropdown_button, '.adminAccessoryButton.gearButton'
  #element :cogwheel_dropdown_button, :xpath, "/html[2]/body/div[1]/div[3]/div/div/table/tbody/tr/td/table/tbody/tr/td[3]/table/tbody/tr/td[2]/div/img"
  element :add_user_option, :xpath, ".//div[@class='advancedsupport-DropDownCheckBox-settingLabel'][contains(text(), 'Add User')]"
  element :assign_skills_option, :xpath, ".//div[@class='advancedsupport-DropDownCheckBox-settingLabel'][contains(text(), 'Assign Skills')]"
          #".//div[contains(text(), 'Assign Skills')]"
          #"//div[ancestor::table][text()='Assign Skills']"

  element :search_field, '.searchBox'
  #element :search_button, :xpath, "//img[@class='common-SearchBox-searchbox_submitBig']"
  element :assign_skills_button, :xpath, "//button[text()='Assign']"
  element :rules_based_assignment_option, :xpath, "//div[ancestor::table][text()='Rules Based Assignment']"
  element :assign_sites_option, :xpath, "//div[ancestor::table][text()='Assign Sites']"


  def get_site_locator site
    find(:xpath, "//td[text()='#{site}']/preceding-sibling::td//input")
  end

  def find_user (email)
    find(:xpath, ".//*[contains(@__gwt_cell, 'cell-gwt-uid')][contains(text(), '#{email}')]")
  end

  def check_user(user)
    find(:xpath, ".//div[contains(text(), '#{user}')]/ancestor::tr[1]//input[@type='checkbox']").click
  end

  def open_add_user_pop_up
    cogwheel_dropdown_button.click
    add_user_option.click
  end

  def get_email_locator  (email)
    return ".//div[@title='#{email}']"
  end

  def get_access_level_locator  (email, role)
    return "//div[@title='#{email}']/ancestor::tr[1]/td[3]/div[text()='#{role}']"
  end

  def click_cogwheel_dropdown
    page.execute_script("document.getElementsByTagName('img')[9].click()")
  end

  def check_skill skill_name, skill_category, skill_level
    find(:xpath, "//td[contains(text(),'#{skill_name}')][child::span[1][text()='#{skill_category}']][child::span[2][text()='#{skill_level}']]/preceding-sibling::td//input").click
  end

  def select_cogwheel_item(name)
    find(:xpath, ".//div[@class='advancedsupport-DropDownCheckBox-settingLabel'][contains(text(), '#{name}')]").click
  end

end
