@chrome
Feature: Edit user page

  Scenario: Site Admin is able to open 'Edit User' page
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    Then I should see 'Edit User' page for site admin

  Scenario: Site Admin is able to Force User to reset password
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I click on 'Force User to reset next time they log in' checkbox
    And I click on 'Change' site admin button
    And I click on 'Close' icon
    And I click on 'Logout' link
    And I login with id 'dimas1@mailinator.com' and the password 'medicine'
    Then I should see 'Account Manager' pop up

  Scenario: Site Admin is able to click on 'Change' button without editing
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I click on 'Change' site admin button
    Then I should see 'User data updated successfully' notification

  Scenario: Site Admin is able to fill the new password
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill new password in 'New Password' textfield
    And I click on 'Change' site admin button
    Then I should see alert notification

  Scenario: Site Admin is able to close 'Password and confirm password doesn't match' pop up
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill new password in 'New Password' textfield
    And I click on 'Change' site admin button
    And I close alert notification
    Then I should see 'Edit User' page for site admin

  Scenario: Site Admin is able to fill the confirm password
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill new password in 'Confirm Password' textfield
    And I click on 'Change' site admin button
    Then I should see alert notification

  Scenario: Site Admin is able to choose title for user
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I select 'Dr' in 'Title' dropdown list
    And I click on 'Change' site admin button
    Then I should see 'User data updated successfully' notification

  Scenario: Site Admin is able to edit first name
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill 'test' in 'First Name' textfield
    And I click on 'Change' site admin button
    Then I should see 'User data updated successfully' notification

  Scenario Outline: Site Admin is not able to edit first name with digits and special characters
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill '<data>' in 'First Name' textfield
    And I click on 'Change' site admin button
    Then I should see 'Invalid first name' notification

  Examples:
|    data   |
|    1234   |
|    @@@@   |
| tester123 |

  Scenario: Site Admin is able to edit last name
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill 'tester' in 'Last Name' textfield
    And I click on 'Change' site admin button
    Then I should see 'User data updated successfully' notification

  Scenario Outline: Site Admin is not able to edit last name with digits and special characters
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill '<data>' in 'Last Name' textfield
    And I click on 'Change' site admin button
    Then I should see 'Invalid last name' notification

  Examples:
|   data    |
|   1234    |
|   @@@@    |
| trster123 |


  Scenario: Site Admin is able to click on 'Disable Prerequisites' checkbox
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I click on 'Disable Prerequisites' checkbox
    And I click on 'Change' site admin button
    Then I should see 'User data updated successfully' notification

  Scenario: Site Admin is able to see list of suggestions in 'Roles' textfield
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill 'ro' in 'Roles' textfield
    Then I should see list of suggestions

  Scenario: Site Admin is able to edit roles
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill 'Tester' in 'Roles' textfield
    And I select current item in list of suggestions
    And I click on 'Change' site admin button
    Then I should see 'User data updated successfully' notification

  Scenario: Site Admin is able to remove roles
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I remove current item from textfield
    And I click on 'Change' site admin button
    Then I should see 'User data updated successfully' notification

#    issue which was reported - OP-1219
#  Scenario: Site Admin is able to see list of suggestions in 'Divisions' textfield
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I fill in 'Search' field with 'dimas1@mailinator.com'
#    And I press 'Enter' button for search field
#    And I click on 'Actions' link
#    And I click on 'Edit User' actions menu item
#    And I fill 'di' in 'Division' textfield
#    Then I should see list of suggestions

#    issue which was reported - OP-1219
#  Scenario: Site Admin is able to edit divisions
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I fill in 'Search' field with 'dimas1@mailinator.com'
#    And I click on 'magnifier' icon
#    And I click on 'Actions' link
#    And I click on 'Edit User' actions menu item
#    And I fill 'divfor' in 'Division' textfield
#    And I click on 'Change' button
#    Then I should see 'User data updated successfully' notification

#    issue which was reported - OP-1603
#  Scenario: Site Admin is able to remove divisions
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I fill in 'Search' field with 'dimas1@mailinator.com'
#    And I click on 'magnifier' icon
#    And I click on 'Actions' link
#    And I click on 'Edit User' actions menu item
#    And I fill '' in 'Divisions' textfield
#    And I click on 'Change' button
#    Then I should see 'User data updated successfully' notification

  Scenario: Site Admin is able to edit External Id
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill 'testertest' in 'External Id' textfield
    And I click on 'Change' site admin button
    Then I should see 'User data updated successfully' notification
    And I click on 'Close' icon
    And I click on 'Logout' link
    And I login with id 'testertest' and the password 'medicine'
    Then I should see 'Home' page

  Scenario: Site Admin is able to remove External Id
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill 'testertest' in 'External Id' textfield
    And I click on 'Change' site admin button
    And I fill ' ' in 'External Id' textfield
    And I click on 'Change' site admin button
    And I click on 'Close' icon
    And I click on 'Logout' link
    And I login with id 'testertest' and the password 'medicine'
    Then I see 'Sorry, invalid Login ID or password' notification

  Scenario: Site Admin is able to edit Pref Email
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'sera@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill 'tester@test.com' in 'Pref Email' textfield
    And I click on 'Change' site admin button
    Then I should see 'User data updated successfully' notification
    And I click on 'Close' icon
    And I click on 'Logout' link
    And I login with id 'sera@mailinator.com' and the password 'medicine'
    Then I should not see 'Enter preferred email for notifications' pop up

  Scenario: Site Admin is able to remove Pref Email
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'sera@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I fill 'tester@test.com' in 'Pref Email' textfield
    And I click on 'Change' site admin button
    And I fill '' in 'Pref Email' textfield
    And I click on 'Change' site admin button
    And I click on 'Close' icon
    And I click on 'Logout' link
    And I login with id 'sera@mailinator.com' and the password 'medicine'
    Then I should see 'Enter preferred email for notifications' pop up

  Scenario: Site Admin is able to edit user
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas1@mailinator.com'
    And I press 'Enter' button for search field
    And I click on 'Actions' link
    And I click on 'Edit User' actions menu item
    And I change all data of user
      | title  |  first_name  | last_name |   roles  |    pref_email         |
      |  Mr    |   Dmitry     |    Rezn   |  rolipad |  autotest@test.com    |
    And I click on 'Change' site admin button
    Then I should see 'User data updated successfully' notification
