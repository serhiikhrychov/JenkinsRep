@chrome
Feature: Site Admin Change Password

  Scenario: Site Admin is able to open 'Change Password' page
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas4@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'Change Password' actions menu item
    Then I should see 'Account Manager' pop up

  Scenario: Site Admin is able to change user password 'Change Password' page
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I create new user and change his password and login with new password
    Then I should be logged in

  Scenario: Set new password and login with old one
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I create new user and change his password and login with old password
    Then I see 'Sorry, invalid Login ID or password' notification

  Scenario: Use 'Force User to reset next time they log in' and login as user
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas4@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'Change Password' actions menu item
    And I click on 'Force User to reset next time they log in' checkbox and login as user
    Then I should see 'Account Manager' pop up

# issue which was reported OP-1610
#  Scenario: User which was forced to change password can change it
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I create new user with skills and force him to change password:
#      | Skill_Name | Skill_category | Skill_level |
#      | 25         | 25             | 25          |
#    Then I should be logged in

  Scenario: Site Admin is able to see corresponding notification after password was changed
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I create new user and change his password
    Then I should see 'Password changed successfully' notification

  Scenario: Site Admin is able to see corresponding notification after user was forced to change his password
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I create new user and change his password
    Then I should see 'User will be forced to change password on their next login' notification

  Scenario: Site Admin is able to see corresponding notification after 'Save Settings' button was clicked without any data in pop up
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas4@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'Change Password' actions menu item
    And I click on 'Save Settings' button
    Then I should see 'No change to save' notification

  Scenario Outline: Site Admin is able to see error notification after confirmation password does not match
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas4@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'Change Password' actions menu item
    And I fill in 'New Password' field with '<new_password>'
    And I fill in 'Confirm Password' field with '<confirm_password>'
    And I click on 'Save Settings' button
    Then I should see alert notification

  Examples:
    |      new_password     |     confirm_password     |
    |        medicine       |       medicine123        |
    |        #@@@#@#@#      |       medicine           |
    |        123456         |       Medicine10         |


# today

  Scenario: Site Admin is able to see error notification after 'New password' field is blank
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas4@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'Change Password' actions menu item
    And I fill in 'Confirm Password' field with 'medicine'
    And I click on 'Save Settings' button
    Then I should see alert notification

  Scenario: Site Admin is able to see error notification after 'Confirm password' field is blank
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas4@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'Change Password' actions menu item
    And I fill in 'New Password' field with 'medicine'
    And I click on 'Save Settings' button
    Then I should see alert notification

  Scenario: Site Admin is able to see error notification after 'New password' was filled with spaces
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas4@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'Change Password' actions menu item
    And I fill in 'New Password' field with '        '
    And I fill in 'Confirm Password' field with 'medicine'
    And I click on 'Save Settings' button
    Then I should see alert notification

  Scenario: Site Admin is able to see error notification after 'Confirm password' was filled with spaces
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas4@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'Change Password' actions menu item
    And I fill in 'New Password' field with 'medicine'
    And I fill in 'Confirm Password' field with '       '
    And I click on 'Save Settings' button
    Then I should see alert notification

  Scenario: Site Admin is able to see error notification if password less then 5 characters
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas4@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'Change Password' actions menu item
    And I fill in 'New Password' field with 'med'
    And I fill in 'Confirm Password' field with 'med'
    And I click on 'Save Settings' button
    Then I should see alert notification

  Scenario: Site Admin is able to change password and reset password
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I fill in 'Search' field with 'dimas4@mailinator.com'
    And I click on 'magnifier' icon
    And I click on 'Actions' link
    And I click on 'Change Password' actions menu item
    And I fill in 'New Password' field with 'medicine'
    And I fill in 'Confirm Password' field with 'medicine'
    And I click on 'Force User to reset next time they log in' checkbox
    And I click on 'Save Settings' button
    Then I should see 'Password changed successfully & User will be forced to change password on their next login' notification


