@FF
Feature: Login

  Scenario: User should be able to login with valid credentials
    Given I am on the 'Login' page
    When I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    Then I should see 'Home' page


  Scenario Outline: User should see error notification for incorrect login or password
    Given I am on the 'Login' page
    When I login with id '<id>' and the password '<password>'
    Then I see '<notification>' notification

  Examples:
    | id                                               | password                                         | notification                        |
    |                                                  |                                                  | Please provide a valid Login ID     |
    | test                                             | medicine                                         | Sorry, invalid Login ID or password |
    | autotestuser@mailinator.com                      | medicine11                                       | Sorry, invalid Login ID or password |
    | autotestuser@mailinator.com                      | MEDICINE                                         | Sorry, invalid Login ID or password |
    | <SCRIPT SRC=http://ha.ckers.org/xss.js></SCRIPT> | <SCRIPT SRC=http://ha.ckers.org/xss.js></SCRIPT> | Please provide a valid Login ID     |


  Scenario Outline: User should be able to login with various credential
    Given I am on the 'Login' page
    When I login with id '<id>' and the password '<password>'
    Then I should see 'Home' page

  Examples:
    |      id                      |     password         |
    | SERTEST1234@MAILINATOR.COM   |     medicine         |
    | qualitytester@mailinator.com |     #medicine@       |
    |   autoser@mailinator.com     |     Medicine10       |


  Scenario: Use spaces before and after valid value in 'Login ID' text field
    Given I am on the 'Login' page
    When I login with id '  autotestuser@mailinator.com  ' and the password 'medicine'
    Then I should see 'Home' page


  Scenario: Use spaces before and after valid value in 'Password' text field
    Given I am on the 'Login' page
    When I login with id 'autotestuser@mailinator.com' and the password ' medicine '
    Then I see 'Sorry, invalid Login ID or password' notification


  Scenario: User is able to login without skills
    Given I am on the 'Login' page
    When I login with id 'dmitrytest@mailinator.com' and the password 'medicine'
    Then I should see 'Alert' pop up

