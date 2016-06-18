class SiteAdminUnassignSkillsPage < SitePrism::Page

  element :unassign_site_selection, :xpath, ".//option[@value=' Smart site selection']/.."


  def select_site_for_unassign(name)
    find(:xpath, ".//select[@class='gwt-ListBox']/option[contains(text(), '#{name}')]").click
  end

end

