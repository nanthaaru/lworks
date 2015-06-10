Feature: To verify adding new Assemblies with all details

  Background:
    When user logins and navigates to home page
    And user navigates to "Assemblies" tab

  Scenario: Verify able to add new Assemblies
    When user clicks on "New" button
    And user select "APU" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "Assemblies_APU" information from datasheet
    And user clicks on "Save" button
    And user navigates to "Assemblies" tab
    Then verify that newly added records is displayed
      | Constituent Assembly Name |
      | 333444555                 |

  Scenario: Verify able to edit existing Assemblies
    When user selects newly added "333444555" apu assembly
    And user clicks on "Edit" button
    And user fill-in aircraft "Technical details" section
      | Location | Comments      |
      | Chennai  | Test Comments |
    And user clicks on "Save" button

  @manual
  Scenario: Verify able delete newly added Assemblies
    When user selects newly added "333444555" aircraft
    And user clicks on "Delete" button
    And accept browser pop-up
    Then Verify that aircraft "333444555" is deleted
