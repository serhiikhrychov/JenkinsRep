@IE
Feature: Account pop up

  Scenario: User is able to open 'Your Profile' pop up
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    Then I should see 'Your Profile' pop up

  Scenario: User should be able add pref.email in 'Pref. Email' pop up
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I fill in 'Enter preferred email:' text field with 'test@test.com'
    And I click on 'Submit' button
    And I click on 'Account' link
    Then I should see 'test@test.com' email in 'Pref. Email' text field

  Scenario: User is able to remove pref. email
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Account' link
    And I delete all data from 'Pref. Email' text field
    And I click on 'Submit' button
    And I refresh the page
    Then I should see 'Enter preferred email for notifications' pop up

  Scenario: User is able to change First name and Last Name
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    And I edit user name using the following data
      |first_name | last_name |
      | test      | tester    |
    And I click on 'Submit' button
    And I click on 'Account' link
    Then I see 'test' in 'First Name' text field and 'tester' in the 'Last Name' text field

   Scenario Outline: User should be able to use double name in 'First Name' text field
     Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
     When I click on 'Close' icon
     When I click on 'Account' link
     And I fill in name text field with next double name
      |  first_name |  last_name |
      | <First_Name>| <Last_Name>|
     And I click on 'Submit' button
     Then I should not see 'Invalid first name' notification

     Examples:
      | First_Name |  Last_Name  |
      | test test  | tester test |
      | test-test  | tester-test |

  Scenario: User is able to change password in 'Your Profile' pop up
    Given I login with id 'testik@test.com' and the password 'medicine'
    When I click on 'Account' link
    And I fill in 'Old Password' text field with 'medicine'
    And I fill in 'New Password' and in 'Confirm Password' text fields with 'medicine1' and 'medicine1'
    And I click on 'Submit' button
    And I click on 'Logout' link
    And I login with id 'testik@test.com' and the password 'medicine1'
    Then I should see 'Home' page

   Scenario: User is able to change password one more time
    Given I login with id 'testik@test.com' and the password 'medicine1'
    When I click on 'Account' link
    And I fill in 'Old Password' text field with 'medicine1'
    And I fill in 'New Password' and in 'Confirm Password' text fields with 'medicine' and 'medicine'
    And I click on 'Submit' button
    Then I should see 'Home' page

  Scenario: User should see error notification if all fields were cleared and Submit button was clicked
   Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
   When I click on 'Close' icon
   And I click on 'Account' link
   And I cleared all fields
   And I click on 'Submit' button
   Then I should see 'Invalid first name' notification

  Scenario: User should see error notification after filling spaces in 'First Name' text field
   Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
   When I click on 'Close' icon
   And I click on 'Account' link
   And I fill in 'First Name' text field with 'spaces'
   And I click on 'Submit' button
   Then I should see 'Invalid first name' notification

  Scenario:  User should see error notification after filling spaces in 'First Name' text field
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    And I fill in 'First Name' text field with 'with spaces before and after valid value'
    And I click on 'Submit' button
    Then I should see 'Invalid first name' notification

  Scenario:  User should see error notification after filling spaces in 'Last Name' text field
    Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    And I fill in 'Last Name' text field with 'spaces'
    And I click on 'Submit' button
    Then I should see 'Invalid last name' notification


  Scenario Outline: User should see error notification for changing First name to incorrect
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    And I edit user name using the following data
      |first_name         | last_name |
      | <First_Name>      | normal    |
    And I click on 'Submit' button
    Then I should see 'Invalid first name' notification

  Examples:
    |First_Name  |
    |            |
    |**..///,    |
    |1231231231  |

  Scenario:  User should see error notification after filling spaces in 'Last Name' text field
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    And I fill in 'Last Name' text field with 'with spaces before and after valid value'
    And I click on 'Submit' button
    Then I should see 'Invalid last name' notification

  Scenario Outline: User should see error notification for changing Last name to incorrect
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    And I edit user last name using the following data
      |first_name         | last_name |
      | normal            | <Last_Name>     |
    And I click on 'Submit' button
    Then I should see 'Invalid last name' notification

  Examples:
    |Last_Name   |
    |            |
    |**..///,    |
    |1231231231  |

  Scenario Outline: User should see error notification after incorrect password was filled
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    And I fill in 'Old Password' text field with '<old_password>'
    And I fill in 'New Password' and in 'Confirm Password' text fields with '<new_password>' and '<confirm_password>'
    And I click on 'Submit' button
    Then I should see '<notification>' notification

    Examples:
    | old_password | new_password | confirm_password |                notification                    |
    |   medicine   |              |                  |           Invalid New Password                 |
    |              |  medicine1   |    medicine1     |           Invalid Old Password                 |
    |   medicine   |  medicine1   |                  | New Password and Confirm password should match |
    |   medicine   |              |    medicine1     |           Invalid New Password                 |

  Scenario: Error notification is displayed after invalid old password was filled
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    And I fill in 'Old Password' text field with 'qwerty'
    And I click on 'New Password' text field
    Then I should see 'Invalid Old Password' notification

  Scenario: Divisions are displayed in 'Account' pop up for user with divisions
    Given  I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    Then I should see 'div' in 'Division' field which was assigned to current user

  Scenario: Roles are displayed in 'Account' pop up for user with roles
    Given  I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    Then I should see 'role' in 'Role' field which was assigned to current user

  Scenario: Site is displayed in 'Account' pop up for user with site
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    Then I should see 'TestSerg' in 'Site' field which was assigned to current user

  Scenario: User is able to open 'Upload Image' pop up
    Given I login with id 'accountuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Account' link
    And I click on 'Image' icon
    And I click on 'Upload New' button
    Then I should see 'Upload Image' pop up


