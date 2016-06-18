@chrome
Feature: Site Admin Unassign Skills

  Scenario: Site Admin is able to open 'Unassign Skills' page
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    Then I should see 'Unassign Skills' page for site admin

  Scenario: Site Admin should see notification after 'Unassign' button was clicked
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'users' checkbox
    And I open 'Unassign Skills' page
    And I select skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  25        |    25           |   25       |
    And I click on 'Unassign' button
    Then I should see alert notification

  Scenario: Site Admin is able to unassign skill from user
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autoskilluser@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'users' checkbox
    And I open 'Unassign Skills' page
    And I select skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  25        |    25           |   25       |
    And I click on 'Unassign' button
    And I click 'Ok' in notification
    Then I should see 'The un-assignments will take some time to show up' notification

  Scenario: Site Admin is able to unassign several skills from user
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autoskilluser@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'users' checkbox
    And I open 'Unassign Skills' page
    And I select skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    And I click on 'Unassign' button
    And I click 'Ok' in notification
    Then I should see 'The un-assignments will take some time to show up' notification

  Scenario: Site Admin is able to unassign skill from user and check the skills
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autoskilluser@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'users' checkbox
    And I assign skills to user and login as current user:
      |Skill_Name  |Skill_category   |Skill_level |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    And I should see all skills which were assigned
    And I click on 'Logout' link
    And I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    And I click on 'Admin' link
    And I unassign skills from 'autoskilluser@mailinator.com' and login:
      |Skill_Name  |Skill_category   |Skill_level |
      |  25        |    25           |   25       |
      |  26        |    26           |   26       |
      | autosurvey |    1234         |   180      |
    Then I should see 'Alert' pop up

  Scenario: Site Admin should see notification after 'Unassign' button was clicked without user selection
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  25        |    25           |   25       |
    And I click on 'Unassign' button
    Then I should see alert notification

  Scenario: Site Admin is able to close notification after 'Unassign' button was clicked without user selection
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  25        |    25           |   25       |
    And I click on 'Unassign' button
    And I close alert notification
    Then I should see 'Unassign Skills' page for site admin

  Scenario: Site Admin is able to click on 'Unassign' button without skill selection
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'users' checkbox
    And I open 'Unassign Skills' page
    And I click on 'Unassign' button
    Then I should see alert notification

  Scenario: Site Admin is able to close notification after 'Unassign' button was clicked without skill selection
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'users' checkbox
    And I open 'Unassign Skills' page
    And I click on 'Unassign' button
    And I close alert notification
    Then I should see 'Unassign Skills' page for site admin

  Scenario: Site Admin is able to cancel unassign skills
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'users' checkbox
    And I open 'Unassign Skills' page
    And I select skills:
      |Skill_Name  |Skill_category   |Skill_level |
      |  25        |    25           |   25       |
    And I click on 'Unassign' button
    And I click 'Cancel' in alert notification
    Then I should not see 'The un-assignments will take some time to show up' notification

  Scenario: Site Admin is able to select all skills
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on 'Select all' button
    Then I should see '25' checkbox which was checked
    And I should see '26' checkbox which was checked
    And I should see 'autosurvey' checkbox which was checked

  Scenario: Site Admin is able to select all skills and deselect their
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on 'Select all' button
    And I click on 'Select none' button
    Then I should see '25' checkbox which was unchecked
    And I should see '26' checkbox which was unchecked
    And I should see 'autosurvey' checkbox which was unchecked

  Scenario: Site Admin is able to click on 'Select all' button twice
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on 'Select all' button
    And I click on 'Select all' button
    Then I should see '25' checkbox which was checked
    And I should see '26' checkbox which was checked
    And I should see 'autosurvey' checkbox which was checked

  Scenario: Site Admin is able to click on 'Select none' button
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on 'Select none' button
    Then I should see '25' checkbox which was unchecked
    And I should see '26' checkbox which was unchecked
    And I should see 'autosurvey' checkbox which was unchecked

  Scenario: Site Admin is able to click on 'Select none' button twice
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on 'Select none' button
    And I click on 'Select none' button
    Then I should see '25' checkbox which was unchecked
    And I should see '26' checkbox which was unchecked
    And I should see 'autosurvey' checkbox which was unchecked

  Scenario: Site Admin is able to select one skill
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on '25' checkbox
    Then I should see '25' checkbox which was checked

  Scenario: Site Admin is able to deselect skill
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on '25' checkbox
    And I click on '25' checkbox
    Then I should see '25' checkbox which was unchecked

  Scenario: Site Admin is able to deselect skill via 'Select none' button
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on '25' checkbox
    And I click on 'Select none' button
    Then I should see '25' checkbox which was unchecked

  Scenario: Click on 'Select all' button after the selection of skill
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on '25' checkbox
    And I click on 'Select all' button
    Then I should see '26' checkbox which was checked

  Scenario:  Click on 'Select all' button after the deselection of skill
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on 'Select all' button
    And I click on '25' checkbox
    And I click on 'Select all' button
    Then I should see '25' checkbox which was checked

  Scenario: Site admin is able to click on several skills
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on '25' checkbox
    And I click on '26' checkbox
    Then I should see '25' checkbox which was checked
    And I should see '26' checkbox which was checked

  Scenario: Click on 'Select all' button after the selection of several skills
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on '25' checkbox
    And I click on '26' checkbox
    And I click on 'Select all' button
    Then I should see 'autosurvey' checkbox which was checked

  Scenario: Click on 'Select none' button after the selection of several skills
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on '25' checkbox
    And I click on '26' checkbox
    And I click on 'Select none' button
    Then I should see '25' checkbox which was unchecked
    And I should see '26' checkbox which was unchecked

  Scenario: Admin is able to sort skills by alphabet
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select 'Alpha' in dropdown list
    Then I should see '24' skill as first

  Scenario: Admin is able to sort skills by category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select 'Category' in dropdown list
    Then I should see 'autosurvey' skill as first

  Scenario: Admin is able to sort skills by level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select 'Level' in dropdown list
    Then I should see 'autosurvey' skill as first

  Scenario: Site Admin is able to do searching by skill name
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '25' in search field
    And I click on 'skill magnifier' icon
    Then I should see '24' skill as first

  Scenario: Site Admin is able to do searching by category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '1234' in search field
    And I press 'Enter' button for search field in pop up
    Then I should see 'autosurvey' skill as first

  Scenario: Site Admin is able to do searching by level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '180' in search field
    And I press 'Enter' button for search field in pop up
    Then I should see 'autosurvey' skill as first

  Scenario: Site Admin is able to do searching by one char
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill 'a' in search field
    And I press 'Enter' button for search field in pop up
    Then I should see 'autosurvey' skill as first

   Scenario: Site Admin is able to do searching by any characters
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill 'test' in search field
    And I press 'Enter' button for search field in pop up
    Then I should not see any skill

  Scenario: Site Admin should see notification after 'search' field was filled with spaces only
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '  ' in search field
    And I press 'Enter' button for search field in pop up
    Then I should see 'Please enter a valid search term' notification

  Scenario: Site Admin should see notification after 'search' field was filled with special characters
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '#@@#' in search field
    And I press 'Enter' button for search field in pop up
    Then I should see 'Please enter a valid search term' notification

  Scenario: Site Admin should see notification after searching without any data in search field
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I press 'Enter' button for search field in pop up
    Then I should see 'Please enter a valid search term' notification

  Scenario: Site Admin should see all categories in 'Category' dropdown list
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on 'Category' dropdown button
    Then I should see all categories in dropdown list

  Scenario: Site Admin is able to select categories in 'Category' dropdown list
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select '1234' category in dropdown list
    Then I should see 'autosurvey' skill as first

  Scenario: Site Admin is able to select blank category in 'Category' dropdown list
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select '1234' category in dropdown list
    And I select blank category in 'Category' dropdown list
    Then I should see '24' skill as first

  Scenario: Site Admin should see all levels in 'Level' dropdown list
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on 'Level' dropdown button
    Then I should see all levels in dropdown list

  Scenario: Site Admin is able to select level in 'Level' dropdown list
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select '180' level in dropdown list
    Then I should see 'autosurvey' skill as first

  Scenario: Site Admin is able to select blank level in 'Level' dropdown list
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select '180' level in dropdown list
    And I select blank level in 'Levels' dropdown list
    Then I should see '24' skill as first

  Scenario: Site Admin is able select different category and level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select '1234' category in dropdown list
    And I select '25' level in dropdown list
    Then I should not see any skill

  Scenario: Site Admin is able select different level and category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select '25' level in dropdown list
    And I select '1234' category in dropdown list
    Then I should not see any skill

  Scenario: Site Admin is able to search skill by level and category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select '180' level in dropdown list
    And I select '1234' category in dropdown list
    Then I should see 'autosurvey' skill as first

  Scenario: Site Admin is able to select all skills in specific category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select '1234' category in dropdown list
    And I click on 'Select all' button
    And I select blank category in 'Category' dropdown list
    Then I should see 'autosurvey' checkbox which was checked

  Scenario: Select all skills of several categories
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select '1234' category in dropdown list
    And I click on 'Select all' button
    And I select '25' category in dropdown list
    And I click on 'Select all' button
    And I select blank category in 'Category' dropdown list
    Then I should see 'autosurvey' checkbox which was checked
    And I should see '25' checkbox which was checked

  Scenario: Sorting by category after 'Select all' button was clicked
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on 'Select all' button
    And I select '1234' category in dropdown list
    Then I should see 'autosurvey' checkbox which was checked

  Scenario: Sorting by level after 'Select all' button was clicked
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on 'Select all' button
    And I select '180' level in dropdown list
    Then I should see 'autosurvey' checkbox which was checked

  Scenario: Select all skills of several levels
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I select '180' level in dropdown list
    And I click on 'Select all' button
    And I select '25' level in dropdown list
    And I click on 'Select all' button
    And I select blank level in 'Levels' dropdown list
    Then I should see 'autosurvey' checkbox which was checked
    And I should see '25' checkbox which was checked

  Scenario: Search by title of skill and category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '25' in search field
    And I press 'Enter' button for search field in pop up
    And I select '25' category in dropdown list
    Then I should see '25' skill as first

  Scenario: Search by title of skill and different category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '25' in search field
    And I press 'Enter' button for search field in pop up
    And I select '26' category in dropdown list
    Then I should not see any skill

  Scenario: Search by title of skill and level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '25' in search field
    And I press 'Enter' button for search field in pop up
    And I select '25' level in dropdown list
    Then I should see '25' skill as first

  Scenario: Search by title of skill and different level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '25' in search field
    And I press 'Enter' button for search field in pop up
    And I select '26' level in dropdown list
    Then I should not see any skill

  Scenario: Search by title of category and category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '1234' in search field
    And I press 'Enter' button for search field in pop up
    And I select '1234' category in dropdown list
    Then I should see 'autosurvey' skill as first

  Scenario: Search by title of category and different category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '1234' in search field
    And I press 'Enter' button for search field in pop up
    And I select '25' category in dropdown list
    Then I should not see any skill

  Scenario: Search by title of category and level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '1234' in search field
    And I press 'Enter' button for search field in pop up
    And I select '180' level in dropdown list
    Then I should see 'autosurvey' skill as first

  Scenario: Search by title of category and different level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '1234' in search field
    And I press 'Enter' button for search field in pop up
    And I select '25' level in dropdown list
    Then I should not see any skill

  Scenario: Search by title of level and category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '180' in search field
    And I press 'Enter' button for search field in pop up
    And I select '1234' category in dropdown list
    Then I should see 'autosurvey' skill as first

  Scenario: Search by title of level and different category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '180' in search field
    And I press 'Enter' button for search field in pop up
    And I select '25' category in dropdown list
    Then I should not see any skill

  Scenario: Search by title of level and level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '180' in search field
    And I press 'Enter' button for search field in pop up
    And I select '180' level in dropdown list
    Then I should see 'autosurvey' skill as first

  Scenario: Search by title of level and different level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill '180' in search field
    And I press 'Enter' button for search field in pop up
    And I select '25' category in dropdown list
    Then I should not see any skill

  Scenario: Search by title, category and level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill 'autosurvey' in search field
    And I press 'Enter' button for search field in pop up
    And I select '1234' category in dropdown list
    And I select '180' level in dropdown list
    Then I should see 'autosurvey' skill as first

  Scenario: Search by title, category and different level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill 'autosurvey' in search field
    And I press 'Enter' button for search field in pop up
    And I select '1234' category in dropdown list
    And I select '25' level in dropdown list
    Then I should not see any skill

  Scenario: Search by title, level and different category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I fill 'autosurvey' in search field
    And I press 'Enter' button for search field in pop up
    And I select '180' level in dropdown list
    And I select '25' category in dropdown list
    Then I should not see any skill

#   check the email
#  Scenario: Check the email after skills were assigned to one user
#    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
#    And I click on 'magnifier' icon
#    And I click on 'users' checkbox
#    And I open 'Unassign Skills' page
#    And I select skills:
#      |Skill_Name  |Skill_category   |Skill_level |
#      |  25        |    25           |   25       |
#    And I click on 'Once finished, send emails to' checkbox
#    And I fill 'sser6286@gmail.com' in 'Once finished, send emails to' textfield
#    And I click on 'Assign' button
#    And I click 'Ok' in notification
#    Then I should see email in mailbox

  Scenario: Site Admin should see corresponding notification if he tried to get email notification without email address
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'users' checkbox
    And I open 'Unassign Skills' page
    And I select skills:
      | Skill_Name | Skill_category | Skill_level |
      | 25         | 25             | 25          |
    And I click on 'Once finished, send emails to' checkbox
    And I fill ' ' in 'Once finished, send emails to' textfield
    And I click on 'Unassign' button
    Then I should see alert notification

  Scenario: Site Admin should be able to close corresponding notification
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'users' checkbox
    And I open 'Unassign Skills' page
    And I select skills:
      | Skill_Name | Skill_category | Skill_level |
      | 25         | 25             | 25          |
    And I click on 'Once finished, send emails to' checkbox
    And I fill ' ' in 'Once finished, send emails to' textfield
    And I click on 'Unassign' button
    And I close alert notification
    Then I should see 'Unassign Skills' page for site admin

  Scenario: Site Admin should see corresponding notification if he tried to get email notification with incorrect email address
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'users' checkbox
    And I open 'Unassign Skills' page
    And I select skills:
      | Skill_Name | Skill_category | Skill_level |
      | 25         | 25             | 25          |
    And I click on 'Once finished, send emails to' checkbox
    And I fill 'test' in 'Once finished, send emails to' textfield
    And I click on 'Unassign' button
    Then I should see alert notification

  Scenario: Site admin is able to return on 'Site Admin Manager' page
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Unassign Skills' page
    And I click on 'Site Admin Manager' in bread crumbs
    Then I should see 'Site Admin Manager' page





