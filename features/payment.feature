Feature: To verify adding payment to an existing Aircraft with all details

  Background:
    When user logins and navigates to home page
    And user navigates to "Aircraft" tab

  Scenario: Verify able to add new Payment
    When user selects an existing "SW101 (A320)" Aircraft
    And user selects an existing utilization report "2015-03-001"
    And user selects an existing invoice "SW101-A001-MR"
    And user clicks on "New Payment" button
    And user fill-in "Payment" information from datasheet
    Then verify that newly added records is displayed
      | Invoice  |
      | SW101-A001-MR |

