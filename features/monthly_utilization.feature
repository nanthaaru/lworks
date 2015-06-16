Feature: To verify adding new Aircraft with all details

  Background:
    When user logins and navigates to home page
    And user navigates to "Aircraft" tab

  Scenario: Verify able to add new Aircraft
#    When user clicks on "New" button
#    And user fill-in "Aircraft" information from datasheet
#    And user clicks on "Save" button
    And user navigates to "Aircraft" tab
#    Then verify that newly added records is displayed
#      | Aircraft Name    | MSN       | Aircraft Type | Status  |
#      | SouthWest (A321) | SouthWest | A321          | Pending |

  Scenario: Verify able to edit existing Aircraft
    When user selects newly added "SouthWest (A321)" aircraft
    And user clicks on "Edit" button
    And user fill-in aircraft "Technical details" section
      | Line # | Number Of Landing Gears |
      | 532    | 3                       |
    And user clicks on "Save" button

  Scenario: Verify able delete newly added Aircraft
    When user selects newly added "SouthWest (A321)" aircraft
    And user clicks on "Delete" button
    And accept browser pop-up
    Then Verify that aircraft "SouthWest (A321)" is deleted