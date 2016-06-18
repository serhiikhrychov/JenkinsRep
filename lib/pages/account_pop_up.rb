class AccountPopup < SitePrism::Page

  set_url '/index.jsp'

  element :first_field, :xpath, "//div[contains(.,'First Name')]/../../td/input[@type='text']"
  element :last_field, :xpath, "//div[contains(.,'Last Name')]/../../td/input[@type='text']"
  element :pref_email, :xpath, "//div[contains(.,'Pref. Email')]/../../td/input[@type='text']"
  element :old_password, :xpath, "//div[contains(.,'Old Password')]/../../td/input[@type='password']"
  element :new_password, :xpath, "//div[contains(.,'New Password')]/../../td/input[@type='password']"
  element :confirm_password, :xpath, "//div[contains(.,'Confirm Password')]/../../td/input[@type='password']"
  element :pref_email_text_box, '.gwt-TextBox'
  element :upload_new_button, '.Accountbtn'
  element :image_icon, '.gwt-Image.AccountImg'

  # def get_error_notification_locator (notification)
  #   "//div[@class='gwt-Label'][contains(text(), '#{notification}')]"
  # end

  def div_role_site_in_account(name)
    find(:xpath, "//*[@class='TextStyleAccountSmall'][contains(text(), '#{name}')]")
  end
end
