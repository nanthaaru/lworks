Feature: To verify adding new invoice with all details

  Background:
    When user logins and navigates to home page
    And user navigates to "Aircraft" tab
    And user selects newly added "SouthWest (A321)" aircraft
    And user selects newly added "2015-05-002"

  Scenario: Verify able to add new Invoice
    When user clicks on "New Invoice" button
    And user select "Aircraft MR" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "Invoice_Aircraft_MR" information from datasheet
    And user clicks on "Save" button
    And user navigates to "Aircraft" tab
    And user selects newly added "SouthWest (A321)" aircraft
    And user selects newly added "2015-05-002"
    Then verify that newly added records is displayed
      | Invoice Name      |
      | SouthWest-A015-MR |

  Scenario: Verify able to edit existing Invoice
    When user selects newly added "SouthWest-A015-MR" aircraft
    And user clicks on "Edit" button
    And user fill-in aircraft "Technical details" section
      | Heavy Maint 1 Airframe | Heavy Maint 2 Airframe |
      | 2800                   | 3200                   |
    And user clicks on "Save" button

  Scenario: Verify able delete newly added Invoice
    When user selects newly added "SouthWest-A015-MR" aircraft
    And user clicks on "Delete" button
    And accept browser pop-up
    Then Verify that aircraft "SouthWest-A015-MR" is deleted