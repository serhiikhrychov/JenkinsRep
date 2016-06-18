@chrome
Feature: Survey

  Scenario: User is able to open survey
    When I logged in as user with assigned skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  24        |    24           |   24       |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    And I click on '1234' category
    And I click on 'Survey' button
    And I should see 'Survey' pop up
    And I click on 'Close' icon
    Then I should see unmarked checkbox
    And I should see '0' in statistic

  Scenario: User is able to pass the survey
    When I logged in as user with assigned skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  24        |    24           |   24       |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    And I click on '1234' category
    And I click on 'Survey' button
    And I pass the survey
    And I click on '1234' category
    Then I should see checkbox which was checked
    And I should see '1' in statistic

  Scenario: User is able to pass the survey two times
    When I logged in as user with assigned skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  24        |    24           |   24       |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    And I click on '1234' category
    And I click on 'Survey' button
    And I pass the survey
    And I click on '1234' category
    And I click on 'Survey' button
    And I pass the survey
    Then I should see checkbox which was checked
    And I should see '1' in statistic

  Scenario: User is able to select another answer
    When I logged in as user with assigned skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  24        |    24           |   24       |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    When I click on '1234' category
    And I click on 'Survey' button
    And I select answer
    And I select another answer
    Then I should see 'Next' button

  Scenario: User is able to open second question
    When I logged in as user with assigned skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  24        |    24           |   24       |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    When I click on '1234' category
    And I click on 'Survey' button
    And I open second question
    Then I should see '2' question

