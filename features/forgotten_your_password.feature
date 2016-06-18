@IE
Feature: Forgotten your password

  Scenario: User is able to get a recovery mail and reset the password
    Given I am on the 'Login' page
    When I sent mail for reset password for user with id 'testerauto36@gmail.com'
    Then I get email to mailbox with link and click on it
    And I fill in 'Input_Password' field with password 'medicine1' and click on 'Go' button
    Then I login with id 'testerauto36@gmail.com' and the password 'medicine1'

  Scenario: User is able to see 'Please enter a valid email-id' notification after clicking on 'Go' button
    Given I am on the 'Login' page
    When I open 'Forgot your password'
    And I click on 'Go' button
    Then I see 'Please enter a valid email-id' notification

   Scenario Outline: User should see error notification for incorrect email
     Given I am on the 'Login' page
     When I open 'Forgot your password'
     And I fill in 'Forgot your password' field with '<data>'
     And I click on 'Go' button
     Then I see 'Please enter a valid email-id' notification

    Examples:
     |                     data                         |
     |                   #test@test.com                 |
     |                       test                       |
     |                    @test.com                     |
     |                   test@test.                     |
     | <SCRIPT SRC=http://ha.ckers.org/xss.js></SCRIPT> |
