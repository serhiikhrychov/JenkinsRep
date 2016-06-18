#Feature: Rules_based_assignment
#
#  Scenario: Admin should be able to to open 'Rules Based Assignment' pop up
#    Given I login with id 'autotest@mailinator.com' and the password 'medicine'
#    When I click on 'Admin' link
#    And I click on 'Add Users' button
#    And I click on "Cogwheel" dropdown button
#    And I select 'Rules Based Assignment' menu item
#    Then I should see 'Rules Based Assignment' pop up
#
#  Scenario: It is possible to add action
#    Given I am in 'Rules Based Assignment' pop up
#    When I fill in all fields with data:
#      | rule_name | division | role |   site   |
#      |   Test    |   di     |  ro  | TestSerg |
#    And I select 'Audiology' in 'Apply Division' dropdown
#    And I click on 'Add action' button
#    Then I see the following data in the table:
#      |   Test    |   di     |  ro  | TestSerg | Audiology  |

#
#  Scenario: It is possible to apply rule
#    Given I login with id 'autotest@mailinator.com' and the password 'medicine' and open Admin section
#    When I click on 'Add Users' button
#    And I opened 'Rules Based Assignment' pop up
#    And I fill in all fields with data:
#      | Rule Name | Division | Role |   Site   |
#      |   Test    |   di     |  ro  | TestSerg |
#    And I select 'Audiology' in 'Apply Division' dropdown
#    And I click on 'Add action'
#    And I click on 'Apply Rule' button
#    And I click on 'Close' button
#    And I click on 'Advanced Search' link
#    And I fill in all fields with data:
#      | Roles  | Divisions  | Sites    |
#      |   ro   |     di     | TestSerg |
#    And I click on 'Search' button
#    Then I should see next data:
#      | Division | Role |   Site   |
#      |   di     |  ro  | TestSerg |
