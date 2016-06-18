class EditUserPage < SitePrism::Page

  element :force_reset_password, :xpath, ".//label[contains(text(), 'Force User to reset next time they log in')]/../input"
  element :new_password_textfield, :xpath, "//div[@class='gwt-Label'][contains(text(), 'New password')]/../..//td[2]/input"
  element :confirm_password_textfield, :xpath, "//div[@class='gwt-Label'][contains(text(), 'Confirm password')]/../..//td[2]/input"
  element :first_name_field, :xpath, "//div[@class='gwt-Label'][contains(text(), 'First Name')]/../..//td[2]/input"
  element :last_name_field, :xpath, "//div[@class='gwt-Label'][contains(text(), 'Last Name')]/../..//td[2]/input"
  element :disable_prerequisites_checkbox, :xpath, "//div[@class='gwt-Label'][contains(text(), 'Disable Prerequisites')]/../..//td[2]/span/input"
  element :roles_textfield, :xpath, "//div[@class='gwt-Label'][contains(text(), 'Roles')]/../..//div[@class='combinedBorder']//input[@class='invisibleBorder']"
  element :suggestions_list, '.suggestPopupMiddleCenterInner.suggestPopupContent'
  element :suggestions_list_item, :xpath, ".//strong"
  element :pref_email, :xpath, "//div[@class='gwt-Label'][contains(text(), 'Pref. Email')]/../..//td[2]/input"
  element :external_id, :xpath, "//div[@class='gwt-Label'][contains(text(), 'External Id')]/../..//td[2]/input"



  def select_title_in_dropdown(name)
    find(:xpath, "//select[@class='gwt-ListBox']/option[contains(text(), '#{name}')]").click
end

end