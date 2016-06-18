#Feature: Assign Skills
#
#  Scenario: System Admin should be able to assign skills
#    When i am on the 'Add User' page with newly created user with 'randomemail' id:
#    And I search Email address from 'randomemail'
#    And I check user with 'randomemail' mail
#    And I click on "Cogwheel" dropdown button
#    And I select 'Assign Skills' menu item
#    And I 'Assign' these skills:
#    |Skill_Name  |Skill_category   |Skill_level |
#    |  24        |    24           |   24       |
#    |  25        |    25           |   25       |
#    |  26        |    26           |   26       |
#    |  123       |    1234         |   180      |
#    |  1231      |    123          |   123      |
#    And I log out
#    And I login as 'randomemail' with the password 'medicine'
#    And I close all start pop-ups
#    Then I should see these skills:
#      |Skill_Name  |Skill_category   |Skill_level |
#      |  24        |    24           |   24       |
#      |  25        |    25           |   25       |
#      |  26        |    26           |   26       |
#      |  123       |    1234         |   180      |
#      |  1231      |    123          |   123      |
#
