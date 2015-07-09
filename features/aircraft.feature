Feature: To verify adding new Aircraft with all details

  Background:
    When user logins and navigates to home page
    And user navigates to "Aircraft" tab

  @ignore
  Scenario: Verify able to add new Aircraft
    When user clicks on "New" button
    And user fill-in "Aircraft" information from datasheet
    And user clicks on "Save" button
    And user navigates to "Aircraft" tab
    Then verify that newly added records is displayed
      | Aircraft Name    | MSN       | Aircraft Type | Status  |
      | SouthWest (A321) | SouthWest | A321          | Pending |

  @ignore
  Scenario: Verify able to edit existing Aircraft
    When user selects newly added "SouthWest (A321)" aircraft
    And user clicks on "Edit" button
    And user fill-in aircraft "Technical details" section
      | Line # | Number Of Landing Gears |
      | 532    | 3                       |
    And user clicks on "Save" button

  @ignore
  Scenario: Verify able delete newly added Aircraft
    When user selects newly added "SouthWest (A321)" aircraft
    And user clicks on "Delete" button
    And accept browser pop-up
    Then Verify that aircraft "SouthWest (A321)" is deleted




#    When user selects newly added "-2015-03-03-080613 MSN" aircraft
#    Given user clicks on "Cancel" button
#    Given user clicks on "New Sub Components/LLPs" button
#    And user fill-in aircraft "Technical details" section
#      | Record Type of new record |
#      | CFM56 LLPs              |
#        Given user clicks on "Continue" button
#    Given user clicks on "Cancel" button
#
#    Given user clicks on "New Sub Components/LLPs" button
#    And user fill-in aircraft "Technical details" section
#      | Record Type of new record |
#      |  Non-CFM56 LLPs              |
#    Given user clicks on "Continue" button
#    Given user clicks on "Cancel" button

#    Given user clicks on "New Assembly Eligible Event" button
#    Given user clicks on "Cancel" button

#    Given user clicks on "New Constt Assembly Eligible Event Invoice" button

#    And user fill-in aircraft "Technical details" section
#      | Record Type of new record |
#      | Aircraft MR              |
#    Given user clicks on "Continue" button
#
#    Given user clicks on "Cancel" button
#    Given user clicks on "New Invoice" button


#    And user fill-in "Aircraft" information from datasheet
#    And user clicks on "Save" button
#    And user navigates to "Aircraft" tab
#
#    Then verify that newly added records is displayed
#      | Aircraft Name | MSN   | Aircraft Type | Status    |
#      | SW707 (B727)  | SW707 | A746          | Available |
#
#    Then verify that newly added records is displayed
#      | Aircraft Name | MSN   | Aircraft Type | Status    |
#      | SW707 (B727)  | SW707 | A746          | Available |
#
#  Scenario: Verify able to edit existing Aircraft
#    When user selects newly added "SW707 (B727)" aircraft
#    And user clicks on "Edit" button
#    And user fill-in aircraft "Technical details" section
#      | Line # | Number Of Landing Gears |
#      | 532    | 3                       |
#    And user clicks on "Save" button
#
#  Scenario: Verify able delete newly added Aircraft
#    When user selects newly added "SW707 (B727)" aircraft
#    And user clicks on "Delete" button
#    And accept browser pop-up
#    Then Verify that aircraft "SW707 B727" is deleted
#
#
#
#
#




