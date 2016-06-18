class RulesBasedAssignment < SitePrism::Page

  element :rule_name, '.gwt-TextBox'
  element :division, :xpath, "//div[@class='gwt-Label'][contains(text(),'Division')]//ancestor::tr[1]//select"
  element :role, :xpath, "//div[@class='gwt-Label'][contains(text(),'Role')]//ancestor::tr[1]//select"
  element :site, :xpath, "//div[@class='gwt-Label'][contains(text(),'Site')]//ancestor::tr[1]//select"
  element :apply_division, :xpath, "//label[contains(text(),'Apply Division')]//ancestor::tr[1]//select"
  element :apply_role, :xpath, "//label[contains(text(),'Apply Role')]//ancestor::tr[1]//select"
  element :add_action_button, '.gwt-Button'
  element :table_data, :xpath, "//strong['Rule Name']/ancestor::tbody[1]"

end