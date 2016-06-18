class AddUserPopUp < SitePrism::Page

  set_url '/admin.jsp#/physician/add'

  element :add_user_popup_title, :xpath, "//*[@class='Caption']"
  element :first_name_field, :xpath, "//div[@class='gwt-Label'][contains(text(), 'First Name')]/../..//td[2]/input"
          #"//div[contains(text(),'First Name')]/ancestor::tr[1]//input"
  element :last_name_field, :xpath, "//div[@class='gwt-Label'][contains(text(), 'Last Name')]/../..//td[2]/input"
  element :email_address_field, :xpath, "//div[contains(text(),'Email')]/ancestor::tr[1]//input"
  element :password_field, :xpath, "//div[contains(text(),'Password')]/ancestor::tr[1]//input"
  element :confirm_password_field, :xpath, "//div[contains(text(),'Confirm password')]/ancestor::tr[1]//input"
  element :assign_site_dropdown, :xpath, "//div[contains(text(),'Assign Site')]/ancestor::tr[1]//select"
  element :add_user_button, :xpath, "//button[text()='Add User']"
  element :access_level_dropdown, :xpath, "//div[text()='Access Level:']/ancestor::tr[1]//select"
  element :close_pop_up_button, :xpath, "//img[@class='closeImage']"
  element :divisions, :xpath, "//div[contains(text(), 'Divisions')]/../..//input[@class]"
  element :roles, :xpath, "//div[contains(text(), 'Roles')]/../..//input[@class]"


  def fill_required_fields(first_name, last_name, email, password, confirm_password)
    first_name_field.set first_name
    last_name_field.set last_name
    email_address_field.set email
    password_field.set password
    confirm_password_field.set confirm_password
  end

  def assign_site site
    #assign_site_dropdown.click
    #sleep 1
    #find(:xpath, "//option[text()='#{site}']").click
    page.select site, :from => assign_site_dropdown
  end

  def select_role (role)
    access_level_dropdown.click
    find(:xpath, "//option[@value='#{role}']").click
    #page.select 'Select Sites', :from => assign_site_dropdown
  end

  def click_add_user_button
    #add_user_button.click
    page.execute_script("document.getElementsByTagName('button')[0].click()");
  end

  def get_error_notification_locator (notification)
    return "//*[@class='gwt-PopupPanel']//*[contains(text(),'#{notification}')]"
  end

  def select_site(name)
    find(:xpath, ".//select[@class='gwt-ListBox']/option[contains(text(), '#{name}')]").click
  end

end

