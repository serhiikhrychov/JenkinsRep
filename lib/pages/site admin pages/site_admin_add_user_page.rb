class SiteAdminAddUserPage < SitePrism::Page

  element :email_textfield, :xpath, ".//div[@class='gwt-Label'][contains(text(), 'Email address')]/../../td[2]/input"
  element :password_textfield, :xpath, ".//div[@class='gwt-Label'][contains(text(), 'Password')]/../../td[2]/input"
  element :confirm_password_textfield, :xpath, ".//div[@class='gwt-Label'][contains(text(), 'Confirm password')]/../../td[2]/input"
  element :prerequisites_checkbox, :xpath, ".//div[contains(text(),'Prerequisites will not be applied for this user')]"
  element :remove_item_from_field, '.taggedX'
  element :divisions_textfield, :xpath, "//div[@class='gwt-Label'][contains(text(), 'Divisions')]/../..//div[@class='combinedBorder']//input[@class='invisibleBorder']"


  def find_title(name)
    find(:xpath, ".//*[@class='gwt-ListBox']/option[contains(text(), '#{name}')]")
  end

  def select_title(name)
    find(:xpath, ".//*[@class='gwt-ListBox']/option[contains(text(), '#{name}')]").click
  end

  def find_data_in_roles_field(name)
    find(:xpath, ".//td[contains(text(), '#{name}')]")
  end

end