@chrome
Feature: Site Admin View As User

  Scenario: Site Admin is able to open 'View as User' page
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas3@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'View As User' actions menu item
    Then I should see 'Home' page
    And I see 'Home' link

  Scenario: Site Admin is able to close 'View as User' page
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas3@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'View As User' actions menu item
    And I click on 'Home' link
    And I should not see 'Home' link

  Scenario: Site Admin is able to check and uncheck skill checkbox
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas3@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'View As User' actions menu item
    And I click on '25' category
    And I click on '25' skill checkbox
    Then I should see checkbox which was checked
    And I click on '25' skill checkbox
    And I should see unmarked checkbox

  Scenario: Check the skill checkbox and login as user
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'View as user' mode for specific user and click on checkbox
    And I login as current user
    Then I should see checkbox which was checked

  Scenario: Uncheck the skill checkbox and login as user
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'View as user' mode for specific user and click on checkbox
    And I login as current user
    Then I should see unmarked checkbox

  Scenario: Click on all skills checkboxes and login as user
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'View as user' mode for specific user and click on several checkboxes
    And I login as current user and observe all skills
    Then I should see checkboxes which were checked

  Scenario: Uncheck all skills checkboxes and login as user
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'View as user' mode for specific user and click on several checkboxes
    And I login as current user and observe all skills
    Then I should see unmarked checkboxes
