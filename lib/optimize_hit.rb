class OptimizeHit

  def login_page
    LoginPage.new
  end

  def common_page
    CommonPage.new
  end

  def alert_pop_up
    AlertPopup.new
  end

  def admin_page
    AdminPage.new
  end

  def add_user_page
    AddUserPage.new
  end

  def add_user_pop_up
    AddUserPopUp.new
  end

  def account_pop_up
    AccountPopup.new
  end

  def daily_report_pop_up
    DailyReport.new
  end

  def rules_based_assignment_pop_up
    RulesBasedAssignment.new
  end

  def survey_pop_up
    Survey.new
  end

  def forgotten_password_page
    ForgottenYourPasswordPage.new
  end

  def skill_pop_up
     Skill.new
  end

  def diagnostics_pop_up
    DiagnosticsPopup.new
  end

  def site_admin_manager_pop_up
    SiteAdminManagerPopup.new
  end

  def site_admin_common_page
    SiteAdminCommonPage.new
  end

  def site_admin_edit_page
    EditUserPage.new
  end

  def site_admin_add_user_page
    SiteAdminAddUserPage.new
  end

  def site_admin_assign_skills_page
    SiteAdminAssignSkillsPage.new
  end

  def site_admin_unassign_skill_page
    SiteAdminUnassignSkillsPage.new
  end

  def site_admin_manage_skill_page
    SiteAdminManageSkillPage.new
  end

  def site_admin_view_as_user_page
    SiteAdminViewAsUserPage.new
  end

  def site_admin_change_pass_pop_up
    SiteAdminChangePasswordPopup.new
  end

end
