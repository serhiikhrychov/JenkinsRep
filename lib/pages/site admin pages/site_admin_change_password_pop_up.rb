class SiteAdminChangePasswordPopup < SitePrism::Page

  element :save_settings_button, '.gwt-Button'
  element :reset_password_checkbox, :xpath, ".//span[@class='gwt-CheckBox']//input"

  def find_password_field(name)
    find(:xpath, ".//div[contains(text(),'#{name}')]/../../td[2]/input")
  end

end