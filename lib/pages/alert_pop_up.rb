class AlertPopup < SitePrism::Page


  element :admin_link, :xpath, "//*[@class='gwt-Anchor'][text()='Admin']"
  element :log_out_link, :xpath, "//*[@class='gwt-Anchor'][text()='Logout']"

end