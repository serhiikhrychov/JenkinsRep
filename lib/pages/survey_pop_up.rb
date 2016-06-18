class Survey < SitePrism::Page

  element :survey_button, :xpath, ".//img[contains(@src,'surveyButton')]"
  element :second_question_button, '[src="/images/quizIcons/unanswered.png"]'
  element :survey_finish_button, :xpath, "//*[contains(@class, 'finish_button')]"
          #'.common-QuizPlayer-finish_button'
          #'.common-Survey-finish_button'

  def find_survey_question_label(name)
    find(:xpath, "//div[@class='common-QuizPlayer-questionPanel']/*[text()='#{name}']")
  end

end
