class AdminPage < SitePrism::Page

  set_url '/admin.jsp'

  element :add_users_button, :xpath, ".//span[contains(text(), 'Add Users')]"
  element :login_dropdown, :xpath, "//img[@class='advancedsupport-LoginManager-labelCursor']" #User CSS instead of Xpath
  element :sign_out_option, :xpath, "//div[@class='advancedsupport-LoginManager-labelCursor'][text() = 'Sign out']"

  def click_add_users_button
    add_users_button.click
  end

  def click_dropdown
    page.execute_script("document.getElementsByTagName('img')[2].click()")
  end


end
