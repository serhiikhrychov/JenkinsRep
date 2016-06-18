class SiteAdminAssignSkillsPage < SitePrism::Page

  element :category_dropdown_button, :xpath, ".//tr//td[6]//select"
  element :blank_category, :xpath, ".//tr//td[6]//select//option[@value='']"
  element :level_dropdown_button, :xpath, ".//tr//td[8]//select"
  element :blank_level, :xpath, ".//tr//td[8]//select//option[@value='']"
  element :once_finished_send_emails_checkbox, :xpath, ".//div[@class='gwt-Label'][contains(text(), 'Once finished, send emails to:')]/../../td[1]/span/input"
  element :once_finished_send_emails_textfield, '.gwt-TextBox'

  def click_on_buttons(name)
    find(:xpath, "//button[@class='gwt-Button'][contains(text(), '#{name}')]").click
  end

  def find_checkbox(name)
    find(:xpath, ".//td[contains(text(), '#{name}')]/../td[1]//input")
  end

  def do_sorting_by(name)
    find(:xpath, ".//select[@class='gwt-ListBox']/option[contains(text(), '#{name}')]").click
  end

  def find_first_skill(name)
    find(:xpath, ".//tr[@class='advancedsupport-GroupSkillManager-filterStyle']/../tr[2]/td[contains(text(), '#{name}')]")
end

  def find_categories(name)
    find(:xpath, ".//select//option[contains(text(), '#{name}')]")
  end

  def find_levels(name)
    find(:xpath, ".//tr//td[8]//select//option[contains(text(), '#{name}')]")
  end

  def select_site(name)
    find(:xpath, ".//select[@class='gwt-ListBox siteListBox']/option[contains(text(), '#{name}')]").click
  end

end