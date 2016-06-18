@IE
Feature: Diagnostics

 Scenario: User should be able to open 'Diagnostics' pop up
 Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
 When I click on 'Close' icon
 And I click on 'Diagnostics' link
 Then I should see 'Diagnostics' pop up