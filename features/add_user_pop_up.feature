#Feature: Add User
#
#  Scenario: System Admin should be able to open 'Add User' pop up
#    Given I login with id 'optimizeadm@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I click on 'Add Users' button
#    And I click on "Cogwheel" dropdown button
#    And I select 'Add User' menu item
#    Then I should see 'Add user' pop up
#
#  Scenario: System Admin is able to create a new user
#    Given I am in 'Add User' pop up
#    When I fill all required fields:
#      |First_Name  | Last_Name | Email_address        | Password | Confirm_password |
#      |test        | tester    |  randomemail         | medicine | medicine         |
#    And I select 'TestSerg' site from 'Assign Site' dropdown
#    And I select 'User' role from 'Access Level' dropdown
#    And I click on 'Add User' button
#    And I close 'Add User' pop up
#    And I search Email address from 'randomemail'
#    Then I should see 'randomemail' from email address  and "User" role
#
#  Scenario: System Admin is able to create a new System Admin
#    Given I am in 'Add User' pop up
#    When I fill all required fields:
#      |First_Name  | Last_Name | Email_address        | Password | Confirm_password |
#      |test        | tester    |  randomemail         | medicine | medicine         |
#    And I select 'TestSerg' site from 'Assign Site' dropdown
#    And I select 'System Administrator' role from 'Access Level' dropdown
#    And I click on 'Add User' button
#    And I close 'Add User' pop up
#    And I search Email address from 'randomemail'
#    Then I should see 'randomemail' from email address  and "System Administrator" role
#
#  Scenario: System Admin is able to create a new Site Admin
#    Given I am in 'Add User' pop up
#    When I fill all required fields:
#      |First_Name  | Last_Name | Email_address        | Password | Confirm_password |
#      |test        | tester    |  randomemail         | medicine | medicine         |
#    And I select 'TestSerg' site from 'Assign Site' dropdown
#    And I select 'Site Administrator' role from 'Access Level' dropdown
#    And I click on 'Add User' button
#    And I close 'Add User' pop up
#    And I search Email address from 'randomemail'
#    Then I should see 'randomemail' from email address  and "Site Administrator" role
#
#  Scenario Outline: User should see error notification for creating user with empty fields
#    Given I am in 'Add User' pop up
#    When I create user with '<First_Name>' first name and '<Last_Name>' last name and '<Email_address>' email address and '<Password>' password and '<Confirm_password>' confirming password
#    Then I should see '<Notification>' notification
#
#  Examples:
#    |First_Name  | Last_Name | Email_address         | Password | Confirm_password |  Notification                                     |
#    |test        | tester    |                       | medicine | medicine         |  Email address is mandatory!                      |
#    |test        | tester    |  randomemail2         |          | medicine         | Password field cannot be Blank.                   |
#    |test        | tester    |  randomemail2         | medicine |                  |  Password and confirm password fields do not match|
#    |            | tester    |  randomemail2         | medicine | medicine         |  Please Enter the First Name                      |
#    |test        |           |  randomemail2         | medicine | medicine         |  Last name field cannot be blank                  |