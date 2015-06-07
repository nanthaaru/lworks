Feature: To verify adding new Lease with all details

  Background:
    When user logins and navigates to home page
    And user navigates to "Leases" tab

  Scenario: Verify able to add new Operator
    When user clicks on "New" button
    And user select "Engine" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "Lease_Engine" information from datasheet
    And user clicks on "Save" button
    And user navigates to "Leases" tab
    Then verify that newly added records is displayed
      | Lease Name |
      | SW Engine Lease   |

  Scenario: Verify able to edit existing Operator
    When user selects newly added "SW Engine Lease" aircraft
    And user clicks on "Edit" button
    And user fill-in aircraft "Technical details" section
      | Region  | Managing Company |
      | Western | Orbit            |
    And user clicks on "Save" button

  Scenario: Verify able delete newly added Aircraft
    When user selects newly added "SW Engine Lease" aircraft
    And user clicks on "Delete" button
    And accept browser pop-up
    Then Verify that aircraft "SW Engine Lease" is deleted
