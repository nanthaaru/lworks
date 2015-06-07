Feature: To verify adding new Operator with all details

  Background:
    When user logins and navigates to home page
    And user navigates to "Operators" tab

  Scenario: Verify able to add new Operator
    When user clicks on "New" button
    And user fill-in "Operators" information from datasheet
    And user clicks on "Save" button
    And user navigates to "Operators" tab
    Then verify that newly added records is displayed
      | Operator Name | Revenue       | Total Number Of Aircraft |
      | SW Airlines   | $4,230,000.00 | 12                       |

  Scenario: Verify able to edit existing Operator
    When user selects newly added "SW Airlines" aircraft
    And user clicks on "Edit" button
    And user fill-in aircraft "Technical details" section
      | Address Street      | Phone Number |
      | Crompton Street, CA | 203-456-458  |
    And user clicks on "Save" button

  Scenario: Verify able delete newly added Aircraft
    When user selects newly added "SW Airlines" aircraft
    And user clicks on "Delete" button
    And accept browser pop-up
    Then Verify that aircraft "SW Airlines" is deleted
