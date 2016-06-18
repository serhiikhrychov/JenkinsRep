@chrome
Feature: Skill

  Scenario:  User is able to open skill
    When I logged in as user with assigned skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  24        |    24           |   24       |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    When I click on '25' category
    And I click on 'Learn' button
    Then I should see 'Media Player' pop up

  Scenario: User is able to open and close skill pop up and checkbox will not marked
    When I logged in as user with assigned skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  24        |    24           |   24       |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    And I click on '25' category
    And I click on 'Learn' button
    And I click on answer radiobutton
    And I click on 'Close' icon
    Then I should see unmarked checkbox
    And I should see '0' in statistic

  Scenario:  User is able to pass skill
    When I logged in as user with assigned skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  24        |    24           |   24       |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    And I click on '25' category
    And I click on 'Learn' button
    And I pass the skill
    And I click on '25' category
    Then I should see checkbox which was checked
    And I should see '1' in statistic

  Scenario: User is able to pass the skill two times
    Given I logged in as user with assigned skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  24        |    24           |   24       |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    And I click on '25' category
    And I click on 'Learn' button
    And I pass the skill
    And I click on 'ALL SKILLS' category
    And I click on '25' category
    And I click on 'Learn' button
    And I pass the skill
    Then I should see checkbox which was checked
    And I should see '1' in statistic

  Scenario: User is able to see notification after incorrect answers were filled in Skill
    Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on '25' category
    And I click on 'Learn' button
    And I select incorrect answer and click on 'Next' button
    Then I see 'Oops' notification

  Scenario: Skill is not marked as completed after incorrect answer was selected
    Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on '24' category
    And I click on 'Learn' button
    And I select incorrect answer and click on 'Next' button
    And I click on 'Finish' button
    And I click on 'Close' button
    Then I should see unmarked checkbox
    And I should see '0' in statistic

  Scenario: User is able to retake quiz
    Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on '25' category
    And I click on 'Learn' button
    And I select incorrect answer and click on 'Next' button
    And I click on 'Finish' button
    And I click on 'Retake now' button
    Then I should not see 'Oops' notification

  Scenario: User is able to search the skills
    Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'ALL SKILLS' category
    And I fill in 'Search' field with '24' skill
    Then I should see '24' skill

  Scenario: User is able to open all skills which were passed
    Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'ALL SKILLS' category
    And I click on 'COMPLETED' category
    Then I should see completed skills

  Scenario: User is able to open all skills which were not passed
    Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'ALL SKILLS' category
    And I click on 'INCOMPLETE' category
    Then I should see incomplete skills

  Scenario: User is able to set rating of skills
    When I logged in as user with assigned skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  24        |    24           |   24       |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    And I click on '26' category
    And I click on 'Rating' buttons
    Then I see marked 'Rating' buttons

  Scenario: User is able to select another answer
    Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on '24' category
    And I click on 'Learn' button
    And I select correct answer
    And I select incorrect answer
    Then I should see 'Next' button

