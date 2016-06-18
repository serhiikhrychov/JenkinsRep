@chrome
Feature: Add User Site Admin

  Scenario: Site Admin is able to open 'Add User' page
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    Then I should see 'Add User' page for site admin

  Scenario: Site Admin is able to create user
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill all required fields
    And I click on 'Add User' button
    Then I should see 'It will take around 1 minute for the user to appear in the list and search results' notification

  Scenario: Site Admin is able to create user and search by newly created user
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    Then I fill all required fields and create new user and do searching by newly created user

  Scenario: It is possible to select 'Mr' in 'Title Name' dropdown
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I select 'Mr' in 'Title Name' dropdown list
    Then I should see 'Mr' in 'Title Name' dropdown button

   Scenario: It is possible to select 'Ms' in 'Title Name' dropdown
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I select 'Ms' in 'Title Name' dropdown list
    Then I should see 'Ms' in 'Title Name' dropdown button

    Scenario: It is possible to select 'Dr' in 'Title Name' dropdown
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I select 'Dr' in 'Title Name' dropdown list
    Then I should see 'Dr' in 'Title Name' dropdown button

  Scenario: It is possible to click on 'Add User' button
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I click on 'Add User' button
    Then I should see 'Email address is mandatory' notification

   Scenario: It is possible to fill the 'Email Address' with valid data
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'tester@test.com' in 'Email Address' textfield
    And I click on 'Add User' button
    Then I should see 'Password field cannot be Blank' notification

   Scenario: It is possible to fill the 'Password' textfield with valid data
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'tester@test.com' in 'Email Address' textfield
    And I fill 'test' in 'Password' textfield
    And I click on 'Add User' button
    Then I should see 'Password and confirm password fields do not match' notification

  Scenario: It is possible to fill the Confirm Password textfields with valid data
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'tester@test.com' in 'Email Address' textfield
    And I fill 'test' in 'Confirm Password' textfield
    And I click on 'Add User' button
    Then I should see 'Password and confirm password fields do not match' notification

  Scenario: Site Admin should see error notification if Password and confirm password fields do not match
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'tester@test.com' in 'Email Address' textfield
    And I fill 'test123' in 'Password' textfield
    And I fill 'test' in 'Confirm Password' textfield
    And I click on 'Add User' button
    Then I should see 'Password and confirm password fields do not match' notification

  Scenario: Site Admin should see error notification if Password and confirm password less than 5 characters
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'tester@test.com' in 'Email Address' textfield
    And I fill 'tester' in 'First Name' textfield
    And I fill 'tester' in 'Last Name' textfield
    And I fill 'test' in 'Password' textfield
    And I fill 'test' in 'Confirm Password' textfield
    And I click on 'Add User' button
    Then I should see 'Password field should contain more than 5 characters' notification

  Scenario: Site Admin should see error notification if First name was not filled
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'tester@test.com' in 'Email Address' textfield
    And I fill 'tester' in 'Password' textfield
    And I fill 'tester' in 'Confirm Password' textfield
    And I click on 'Add User' button
    Then I should see 'Please Enter the First Name' notification

  Scenario: Site Admin should see error notification if Last name was not filled
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'tester@test.com' in 'Email Address' textfield
    And I fill 'tester' in 'Password' textfield
    And I fill 'tester' in 'Confirm Password' textfield
    And I fill 'tester' in 'First Name' textfield
    And I click on 'Add User' button
    Then I should see 'Last name field cannot be blank' notification

  Scenario Outline: Site Admin should see error notification if First name was filled with incorrect data
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'tester@test.com' in 'Email Address' textfield
    And I fill 'tester' in 'Password' textfield
    And I fill 'tester' in 'Confirm Password' textfield
    And I fill '<data>' in 'First Name' textfield
    And I click on 'Add User' button
    Then I should see 'Invalid first name' notification

  Examples:
    |   data    |
    |   1234    |
    |   @@@@    |
    | trster123 |

  Scenario Outline: Site Admin should see error notification if Last name was filled with incorrect data
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'tester@test.com' in 'Email Address' textfield
    And I fill 'tester' in 'Password' textfield
    And I fill 'tester' in 'Confirm Password' textfield
    And I fill 'tester' in 'First Name' textfield
    And I fill '<data>' in 'Last Name' textfield
    And I click on 'Add User' button
    Then I should see 'Invalid last name' notification

  Examples:
    |   data    |
    |   1234    |
    |   @@@@    |
    | trster123 |

  Scenario: Site Admin should see error notification if First name was filled with spaces only
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'tester@test.com' in 'Email Address' textfield
    And I fill 'tester' in 'Password' textfield
    And I fill 'tester' in 'Confirm Password' textfield
    And I fill '  ' in 'First Name' textfield
    And I click on 'Add User' button
    Then I should see 'First Name cannot be blank' notification

  Scenario: Site Admin should see error notification if Last name was filled with spaces only
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'tester@test.com' in 'Email Address' textfield
    And I fill 'tester' in 'Password' textfield
    And I fill 'tester' in 'Confirm Password' textfield
    And I fill 'tester' in 'First Name' textfield
    And I fill '   ' in 'Last Name' textfield
    And I click on 'Add User' button
    Then I should see 'Last name field cannot be blank' notification

  Scenario: Site Admin is able to click on 'Disable Prerequisites' checkbox
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I click on 'Disable Prerequisites' checkbox
    Then I see 'Prerequisites will not be applied for this user' notification

  Scenario: Site Admin is able to see list of suggestions in 'Roles' textfield
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'ro' in 'Roles' textfield
    Then I should see list of suggestions

  Scenario: Site Admin is able to add roles
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'Tester' in 'Roles' textfield
    And I select current item in list of suggestions
    Then I should see 'Tester' in 'Roles' textfield

  Scenario: Site Admin is able to remove roles
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I fill 'Tester' in 'Roles' textfield
    And I select current item in list of suggestions
    And I remove current item from textfield
    Then I should see current textfield without any data

# This is the bug which was reported - OP-2061
#  Scenario: Site Admin is able to see list of suggestions in 'Divisions' textfield
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I open 'Add User' page
#    And I fill 'di' in 'Divisions' textfield
#    Then I should see list of suggestions

# This is the bug which was reported - OP-1237
#  Scenario: Site Admin is able to add second division
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I open 'Add User' page
#    And I fill 'div' in 'Divisions' textfield
#    And I select current item in list of suggestions
#    And I fill 'divfor' in 'Division' textfield
#    And I select current item in list of suggestions
#    Then I should see 'divfor' in 'Divisions' textfield

# This is the bug which was reported - OP-2061
#  Scenario: Site Admin is able to remove divisions
#    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I open 'Add User' page
#    And I fill 'div' in 'Divisions' textfield
#    And I remove current item from textfield
#    Then I should see current textfield without any data

  Scenario: Site Admin is able to create user with External Id and login via current External Id
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I create user with External Id and logout
    And I login with id 'autodima' and the password 'medicine'
    Then I should see 'Alert' pop up

  Scenario: Site Admin is able to create user with External Id which containt only digits
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I create user with External Id which containt only digits
    Then I should see 'It will take around 1 minute for the user to appear in the list and search results' notification

  Scenario: Site Admin is able to create user with First Name and Last Name which consist with one character
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I create user with First Name and Last Name which consist with one character
    Then I should see 'It will take around 1 minute for the user to appear in the list and search results' notification

  Scenario: Site Admin is able to create user with First Name and Last Name which consist with the same data
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I create user with First Name and Last Name which consist with the same data
    Then I should see 'It will take around 1 minute for the user to appear in the list and search results' notification

  Scenario: Site Admin should see error notification after creating user with existing email
    Given I login with id 'autositeadmin@mailinator.com' and the password 'medicine'
    When I click on 'Admin' link
    And I open 'Add User' page
    And I create user with existing email
    Then I should see 'Email Id Already Exists' notification

