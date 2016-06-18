@chrome
Feature: Site Admin Manager pop up

  Scenario: Site Admin is able to open 'Site Admin Manager' pop up
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    Then I should see 'Site Admin Manager' pop up for site admin

  Scenario: Site Admin is able to search by valid email
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I press 'Enter' button for search field
    Then I should see 'autotestuser1@mailinator.com' email in 'Email Address' column

  Scenario: It is possible to click on 'x' icon
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I click on 'x' icon
    Then I should see search field without any data

  Scenario: It is possible to do searching with one letter
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'i'
    And I press 'Enter' button for search field
    Then I should see 'itt123m4@mailinator.com' email in 'Email Address' column

  Scenario: It is possible to click on 'magnifier' icon
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I press 'Enter' button for search field
    Then I should see all users

  Scenario: It is possible to click on any of user's checkbox
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'users' checkbox
    Then I should see checked checkbox

  Scenario: Site Admin is able to search by valid email and click on checkbox for current user
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'users' checkbox
    Then I should see checked checkbox

  Scenario: It is possible to unmark any checkbox
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on any checkbox two times
    Then I should see unmarked users checkboxes

  Scenario: It is possible to click on main checkbox
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'main' checkbox
    Then I should see marked users checkboxes

  Scenario: It is possible to click on checkbox for user which was found
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'users' checkbox
    Then I should see checked checkbox

  Scenario: It is possible to click on main dropdown button
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'main' dropdown button
    Then I should see 'main' dropdown list

  Scenario: It is possible to click on 'Select all in this page' menu item in main dropdown list
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'main' dropdown button
    And I click on 'Select all in this page' main menu item
    Then I should see marked users checkboxes

  Scenario: It is possible to click on 'Select all across all pages' menu item in main dropdown list
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'main' dropdown button
    And I click on 'Select all across all pages' main menu item
    Then I should see marked users checkboxes

# This is the bug which was reported OP-1242
#    Scenario: Click on 'Select all across all pages' menu item in main dropdown list and open another site
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I click on 'main' dropdown button
#    And I click on 'Select all across all pages' main menu item
#    And I open 'SMG' site
#    Then I should see unmarked checkboxes

  Scenario: It is possible to click on 'Deselect page' menu item in main dropdown list
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'users' checkbox
    And I click on 'main' dropdown button
    And I click on 'Deselect page' main menu item
    Then I should see unmarked checkboxes

#    can not be tested
#   Scenario: It is possible to deselect one page
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I click on 'main' dropdown button
#    And I click on 'Select all across all pages' main menu item
#    And I click on 'main' dropdown button
#    And I click on 'Deselect page' main menu item
##    And I click on '2' navigation button
#    Then I should see marked checkboxes

  Scenario: It is possible to click on 'Deselect across pages' menu item in main dropdown list
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'main' dropdown button
    And I click on 'Select all across all pages' main menu item
    And I click on 'Deselect across pages' main menu item
    Then I should see unmarked checkboxes
    Then I should see unmarked checkboxes

  Scenario: It is possible to click on 'Clear all selection' link
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'users' checkbox
    And I click on 'Clear all selection' link
    Then I should see unmarked checkboxes

#    bug which was reported  OP-2126
#  Scenario: It is possible to click on 'Up' sorting button in 'First Name' column
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I click on 'SortUp' sorting button in 'First Name' column
#    Then I should see 'autotestuser@mailinator.com' user as first in the table

  #    bug which was reported  OP-2126
#  Scenario: It is possible to click on 'Down' sorting button in 'First Name' column
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I click on 'SortDown' sorting button in 'First Name' column
#    Then I should see 'dimas1@mailinator.com' user as first in the table

  #    bug which was reported  OP-2126
#  Scenario: It is possible to click on 'Up' sorting button in 'Last Name' column
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I click on 'SortUp' sorting button in 'Last Name' column
#    Then I should see 'autotestuser@mailinator.com' user as first in the table

  #    bug which was reported  OP-2126
#  Scenario: It is possible to click on 'Down' sorting button in 'Last Name' column
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I click on 'sortDownActive' sorting button in 'Last Name' column
#    Then I should see 'dimas1@mailinator.com' user as first in the table

  Scenario: It is possible to click on 'Refresh' button
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'Refresh' button
    Then I should see all users

  Scenario: It is possible to click on 'Action' link
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'autotestuser1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    Then I should see 'Actions' dropdown list

  Scenario: It is possible to click on 'Advanced Search' link
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'Advance Search' icon
    Then I should see 'Advanced Search' pop up

  Scenario: It is possible to do searching by valid email in 'Advanced Search' pop up
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'Advance Search' icon
    And I fill in 'Search' field in advanced search with 'autotestuser1@mailinator.com'
    And I click on 'Search' button
    Then I should see 'autotestuser1@mailinator.com' user as first in the table

  Scenario: It is possible to do searching by role in 'Advanced Search' pop up
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'Advance Search' icon
    And I select 'rol' in role dropdown list
    And I click on 'Search' button
    Then I should see 'sera@mailinator.com' user as first in the table

  Scenario: It is possible to do searching by division in 'Advanced Search' pop up
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'Advance Search' icon
    And I select 'divisi' in division dropdown list
    And I click on 'Search' button
    Then I should see 'sera@mailinator.com' user as first in the table

  Scenario: It is possible to do searching by role and division in 'Advanced Search' pop up
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'Advance Search' icon
    And I select 'rol' in role dropdown list
    And I select 'divisi' in division dropdown list
    And I click on 'Search' button
    Then I should see 'sera@mailinator.com' user as first in the table

  Scenario: It is possible to do searching by valid email and role in 'Advanced Search' pop up
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'Advance Search' icon
    And I fill in 'Search' field in advanced search with 'autotestuser1@mailinator.com'
    And I select 'role' in role dropdown list
    And I click on 'Search' button
    Then I should see 'autotestuser1@mailinator.com' user as first in the table

  Scenario: It is possible to do searching by valid email and division in 'Advanced Search' pop up
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'Advance Search' icon
    And I fill in 'Search' field in advanced search with 'autotestuser1@mailinator.com'
    And I select 'div' in division dropdown list
    And I click on 'Search' button
    Then I should see 'autotestuser1@mailinator.com' user as first in the table

  Scenario: It is possible to do searching by valid email and date in 'Advanced Search' pop up
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'Advance Search' icon
    And I fill in 'Search' field in advanced search with 'autotestuser1@mailinator.com'
    And I fill the valid date in 'Created Between' field
    And I click on 'Search' button
    Then I should see 'autotestuser1@mailinator.com' user as first in the table

  Scenario: It is possible to click on 'cogwheel' dropdown button
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I click on 'cogwheel' dropdown button
    Then I should see 'cogwheel' dropdown list