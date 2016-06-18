@chrome
Feature: Site Admin Manage Skill

  Scenario: Site Admin is able to open 'Assign Skills' page
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'Assign Skills' actions menu item
    Then I should see 'Assign Skills' page for site admin

  Scenario: Site Admin is able to assign skill
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I select skills:
      | Skill_Name | Skill_category | Skill_level |
      | 25         | 25             | 25          |
    And I click on 'Save Assignment' button
    Then I should see 'Assignment will take some time to show' notification
    And I should see '25' checkbox which was checked

  Scenario: Site Admin is able to unassign skill
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I select skills:
      | Skill_Name | Skill_category | Skill_level |
      | 25         | 25             | 25          |
    And I click on 'Save Assignment' button
    Then I should see 'Assignment will take some time to show' notification

#    issue which was reported OP-1604
#  Scenario: Site Admin is able to make assignment several times
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I fill in 'Search' field with 'dimas2@mailinator.com'
#    And I click on 'magnifier' icon
#    And I open 'Manage Skills' page
#    And I select skills:
#      | Skill_Name | Skill_category | Skill_level |
#      | 25         | 25             | 25          |
#    And I click on 'Save Assignment' button
#      | Skill_Name | Skill_category | Skill_level |
#      | 25         | 25             | 25          |
#    And I click on 'Save Assignment' button
#    Then I should see 'Assignment will take some time to show' notification

    Scenario: Site Admin is able to open 'Assign Skills' page of the user with assigned skills
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    Then I should see '24' checkbox which was checked
    And I should see '26' checkbox which was checked
    And I should see 'autosurvey' checkbox which was checked

    Scenario: Site Admin is able to assign several skills
      Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
      When I click on 'Admin' link
      And I fill in 'Search' field with 'dimas2@mailinator.com'
      And I click on 'magnifier' icon
      And I open 'Manage Skills' page
      And I select skills:
      | Skill_Name | Skill_category | Skill_level |
      | 25         | 25             | 25          |
      | 26         | 26             | 26          |
      And I click on 'Save Assignment' button
      Then I should see 'Assignment will take some time to show' notification
      And I should see '25' checkbox which was checked
      And I should see '26' checkbox which was checked

  Scenario: Site Admin is able to unassign several skills
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I select skills:
      | Skill_Name | Skill_category | Skill_level |
      | 25         | 25             | 25          |
      | 26         | 26             | 26          |
    And I click on 'Save Assignment' button
    Then I should see 'Assignment will take some time to show' notification
    And I should see '25' checkbox which was unchecked
    And I should see '26' checkbox which was unchecked

    Scenario: Site Admin is able to assign all skills
      Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
      When I click on 'Admin' link
      And I fill in 'Search' field with 'dimas2@mailinator.com'
      And I click on 'magnifier' icon
      And I open 'Manage Skills' page
      And I click on 'Select all' button
      And I click on 'Save Assignment' button
      Then I should see 'Assignment will take some time to show' notification
      And I should see '24' checkbox which was checked
      And I should see '25' checkbox which was checked
      And I should see '26' checkbox which was checked
      And I should see 'autosurvey' checkbox which was checked

  Scenario: Site Admin is able to unassign all skills
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I click on 'Select none' button
    And I click on 'Save Assignment' button
    Then I should see 'Assignment will take some time to show' notification
    And I should see '24' checkbox which was unchecked
    And I should see '25' checkbox which was unchecked
    And I should see '26' checkbox which was unchecked
    And I should see 'autosurvey' checkbox which was unchecked

    Scenario: Site Admin is able to click on 'Save Assignment' button without any skill selection
      Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
      When I click on 'Admin' link
      And I fill in 'Search' field with 'dimas2@mailinator.com'
      And I click on 'magnifier' icon
      And I open 'Manage Skills' page
      And I click on 'Save Assignment' button
      Then I should see alert notification

    Scenario: Site Admin is able to close 'No Changes to Save' pop-up
      Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
      When I click on 'Admin' link
      And I fill in 'Search' field with 'dimas2@mailinator.com'
      And I click on 'magnifier' icon
      And I open 'Manage Skills' page
      And I click on 'Save Assignment' button
      And I close alert notification
      Then I should see 'Assign Skills' page for site admin

    Scenario: Site Admin is able to click on 'Select All' button
      Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
      When I click on 'Admin' link
      And I fill in 'Search' field with 'dimas2@mailinator.com'
      And I click on 'magnifier' icon
      And I open 'Manage Skills' page
      And I click on 'Select all' button
      Then I should see '24' checkbox which was checked
      And I should see '25' checkbox which was checked
      And I should see '26' checkbox which was checked
      And I should see 'autosurvey' checkbox which was checked

    Scenario: Site Admin is able to click on 'Select All' button twice
      Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
      When I click on 'Admin' link
      And I fill in 'Search' field with 'dimas2@mailinator.com'
      And I click on 'magnifier' icon
      And I open 'Manage Skills' page
      And I click on 'Select all' button
      And I click on 'Select all' button
      Then I should see '24' checkbox which was checked
      And I should see '25' checkbox which was checked
      And I should see '26' checkbox which was checked
      And I should see 'autosurvey' checkbox which was checked

    Scenario: Site Admin is able to click on 'Select none' button
      Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
      When I click on 'Admin' link
      And I fill in 'Search' field with 'dimas2@mailinator.com'
      And I click on 'magnifier' icon
      And I open 'Manage Skills' page
      And I click on 'Select none' button
      Then I should see '24' checkbox which was unchecked
      And I should see '25' checkbox which was unchecked
      And I should see '26' checkbox which was unchecked
      And I should see 'autosurvey' checkbox which was unchecked

    Scenario: Site Admin is able to click on 'Select none' button twice
      Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
      When I click on 'Admin' link
      And I fill in 'Search' field with 'dimas2@mailinator.com'
      And I click on 'magnifier' icon
      And I open 'Manage Skills' page
      And I click on 'Select none' button
      And I click on 'Select none' button
      Then I should see '25' checkbox which was unchecked
      And I should see '26' checkbox which was unchecked
      And I should see 'autosurvey' checkbox which was unchecked

  Scenario: Click on one skill and then click on 'Select All' button
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I click on '25' checkbox
    And I click on 'Select all' button
    Then I should see '24' checkbox which was checked
    And I should see '25' checkbox which was checked
    And I should see '26' checkbox which was checked
    And I should see 'autosurvey' checkbox which was checked

  Scenario:  Click on 'Select none' button after the selection of skill
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I click on '25' checkbox
    And I click on 'Select none' button
    Then I should see '24' checkbox which was unchecked
    And I should see '25' checkbox which was unchecked
    And I should see '26' checkbox which was unchecked
    And I should see 'autosurvey' checkbox which was unchecked

  Scenario:  Click on 'Select all' button after the deselection of skill
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I click on 'Select all' button
    And I click on '25' checkbox
    And I click on 'Select all' button
    Then I should see '24' checkbox which was checked
    And I should see '25' checkbox which was checked
    And I should see '26' checkbox which was checked
    And I should see 'autosurvey' checkbox which was checked

  Scenario:  Click on 'Select none' button after the selection of skill
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I click on '25' checkbox
    And I click on 'Select none' button
    Then I should see '24' checkbox which was unchecked
    And I should see '25' checkbox which was unchecked
    And I should see '26' checkbox which was unchecked
    And I should see 'autosurvey' checkbox which was unchecked

  Scenario:  Click on several skills
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I click on '25' checkbox
    And I click on '26' checkbox
    Then I should see '25' checkbox which was checked
    And I should see '26' checkbox which was checked

   Scenario:  Click on several skills and click on 'Select all' button
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I click on '25' checkbox
    And I click on '26' checkbox
    And I click on 'Select all' button
    Then I should see '24' checkbox which was checked
    And I should see '25' checkbox which was checked
     And I should see '26' checkbox which was checked
    And I should see 'autosurvey' checkbox which was checked

   Scenario:  Click on several skills and click on 'Select none' button
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I click on '25' checkbox
    And I click on '26' checkbox
    And I click on 'Select none' button
    Then I should see '25' checkbox which was unchecked
    And I should see '26' checkbox which was unchecked
    And I should see 'autosurvey' checkbox which was unchecked

  Scenario: Admin is able to sort skills by alphabet
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I select 'Alpha' in dropdown list
    Then I should see '24' skill as first

  Scenario: Admin is able to sort skills by category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I select 'Category' in dropdown list
    Then I should see 'autosurvey' skill as first

# issue which was reported OP-2394
#  Scenario: Admin is able to sort skills by level
#    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I fill in 'Search' field with 'dimas2@mailinator.com'
#    And I click on 'magnifier' icon
#    And I open 'Manage Skills' page
#    And I select 'Level' in dropdown list
#    Then I should see 'autosurvey' skill as first

#  today

  Scenario: Site Admin is able to do searching by skill name
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I fill '25' in search field
    And I press 'Enter' button for search field in pop up
    Then I should see '25' skill as first

  Scenario: Site Admin is able to do searching by category
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I fill '1234' in search field
    And I press 'Enter' button for search field in pop up
    Then I should see 'autosurvey' skill as first

  Scenario: Site Admin is able to do searching by level
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I fill '180' in search field
    And I press 'Enter' button for search field in pop up
    Then I should see 'autosurvey' skill as first

  Scenario: Site Admin is able to do searching by one char
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I fill 'a' in search field
    And I press 'Enter' button for search field in pop up
    Then I should see 'autosurvey' skill as first

  Scenario: Site Admin is able to do searching by any characters
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I fill 'test' in search field
    And I press 'Enter' button for search field in pop up
    Then I should not see any skill

  Scenario: Site Admin should see notification after 'search' field was filled with spaces only
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I fill '  ' in search field
    And I press 'Enter' button for search field in pop up
    Then I should see 'Please enter a valid search term' notification

  Scenario: Site Admin should see notification after 'search' field was filled with special characters
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I fill '#@@#' in search field
    And I press 'Enter' button for search field in pop up
    Then I should see 'Please enter a valid search term' notification

  Scenario: Site Admin should see notification after 'magnifier' icon was clicked without any data in search field
    Given I login with id 'autotestuser1@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas2@mailinator.com'
    And I click on 'magnifier' icon
    And I open 'Manage Skills' page
    And I press 'Enter' button for search field in pop up
    Then I should see 'Please enter a valid search term' notification



