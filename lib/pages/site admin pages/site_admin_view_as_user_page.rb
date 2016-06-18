class SiteAdminViewAsUserPage < SitePrism::Page

  element :home_link, '.gwt-Anchor.analytics-AnalyticPanel-Cursor-Pointer'

  def click_on_skill_checkbox(name)
    find(:xpath, ".//*[@class='advancedsupport-skillManger-categoryColor'][text()='#{name}']/../../td[1]//input").click
  end

end