class SiteAdminCommonPage < SitePrism::Page

  element :change_button, '.gwt-Button'
  element :enter_pref_email_popup, :xpath, ".//div[@class='Caption'][contains(text(),'Enter preferred email for notifications')]"
  element :cogwheel_dropdown_list, '.common-dropDownPanel'
  element :site_admin_breadcrumbs, '.first-item-siteadminmanager'
  element :site_admin_manager_page, '.first-item-siteadminmanager'
  element :cogwheel, '#dropDown'
  element :search_field_for_popup, '.common-SearchBox-searchbox'

  def select_actions_menu_item(name)
    find(:xpath, "//div[@class='gwt-Label MenuLabel'][contains(text(), '#{name}')]").click
  end

  def find_title_of_page(name)
   find(:xpath, "//span[contains(text(), '#{name}')]")
  end

  def select_cogwheel_menu_item(name)
    find(:xpath, ".//div[@class='advancedsupport-DropDownCheckBox-settingLabel'][contains(text(), '#{name}')]").click
  end

  def select_option_in_cogwheel(name)
    find(:xpath, "//div[ancestor::table][text()='#{name}']").click
  end

  def press_enter_for_popup
    search_field_for_popup.native.send_keys(:enter)
  end


end