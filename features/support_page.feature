@IE
Feature: Support page

  Scenario: User is able open support page
    Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Help' icon
    Then I should see 'Support' page