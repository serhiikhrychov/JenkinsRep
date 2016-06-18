@IE
Feature: Daily Report

  Scenario: User is able to open 'Daily Report' pop up
    Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Report' link
    Then I should see 'Daily Report' pop up

  Scenario: User is able to create daily report without entering values
    Given I login with id 'autotestuser@mailinator.com' and the password 'medicine'
    When I click on 'Close' icon
    And I click on 'Report' link
    And I click on 'Add Daily Report' button
    Then I should see report for current day in calendar

#  Scenario: User is able to update daily report
#    Given I login with id 'sertest@mailinator.com' and the password 'medicine'
#    When I click on 'Report' link
#    And I click on 'Add Daily Report' button
#    And I fill in all the fields with data:
#      | number_of_patients  |  notes  | time_arrived        | time_you_left       | time_spent_on_paperwork | average_time |
#      |           1         |   test  | 01:30Hrs - 02:00Hrs | 05:30Hrs - 06:00Hrs | 3Hrs                    | 17-20 min    |
#
#    And I click on 'Add Daily Report' button
#    And I set mouse over the report in calendar
#    Then I see daily report tooltip
#    And I see the following data on the tooltip:
#      |Patients :1                           |
#      |Time spent at work:01:30Hrs - 06:00Hrs|
#      |Paperwork:3Hrs                        |
#      |Satisfaction Score:50                 |
#      |Time Spent on PaperWork:3Hrs          |
#      |Notes:test                            |

#    Scenario: User can't create daily report for future date
#      Given I login with id 'sertest@mailinator.com' and the password 'medicine'
#      When I click on 'Report' link
#      And I click on 'Next Month' button
#      And I click on any day
#      And I click on 'Add Daily Report' button
#      Then I should see corresponding notification
#
#    Scenario: User is able to create report for date in the past
#      Given I login with id 'sertest@mailinator.com' and the password 'medicine'
#      When I click on 'Report' link
#      And I click on 'Previous Month' button
#      And I click on any day
#      And I click on 'Add Daily Report' button
#      And I set mouse over the report in past
#      Then I see daily report tooltip