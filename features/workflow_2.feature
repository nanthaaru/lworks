Feature: To verify Regression scenarios to test Workflow - 2

  Background:
    When user logins and navigates to home page

  Scenario: Verify able to add new Aircraft Maintenance Event
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user clicks on "New Aircraft Maintenance Event" button
    And user fill-in "Aircraft_Maintenance_Event" information from regression
    And user clicks on "Save" button
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    Then verify that newly added record is displayed under section "Aircraft Maintenance Events"
      | Eligible Event Name     | Event Type | Induction Date | Actual Claim Amount | Estimated Claim Amount |
      | C-Check-2015-06-28-8429 | C-Check    | 6/28/2015      | $0.00               | $3,000.00              |

  Scenario: Verify on checking "TSN/CSN Accuracy Certified" Checkbox, TSLV and CSLV gets reset
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user selects newly added "C-Check-2015-06-28-8429" aircraft maintenace event
    And user clicks on "Edit" button
    And user fill-in aircraft "Technical details" section
      | TSN/CSN Accuracy Certified |
      | Checked                    |
    And user clicks on "Save" button
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    Then verify that following values are populated in "Operational Metrics" section
      | Time Since Last C-Check | Cycles Since Last C-Check |
      | 0.00                    | 0                         |

  Scenario: Verify able to add new Aircraft Eligible Event Invoice
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user selects newly added "C-Check-2015-06-28-8429" aircraft maintenace event
    And user clicks on "New Aircraft Maintenance Event Invoice" button
    And user fill-in "Aircraft_Maintenance_Event_Invoice" information from regression
    And user clicks on "Save" button
    And user clicks on "Submit for Approval" button
    And accept browser pop-up
    And user selects newly added "Approve / Reject" link
    And user clicks on "Approve" button
    And user clicks on "Deduct From MR" button
    And accept browser pop-up
    And user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    Then verify that following values are populated in "Notional Maintenance Reserve Account Balance" section
      | Notional Maintenance Reserve (Total) | NMR Engine 1 | NMR Engine 2 | NMR APU     | NMR 20 Month C Check | NMR Heavy Maintenance 1 | NMR Heavy Maintenance 2 | Cumulative Unpaid Maintenance Reserve | NMR Engine 1 LLP | NMR Engine 2 LLP | NMR Landing Gear - Left Main | NMR Landing Gear - Left Wing | NMR Landing Gear - Nose | NMR Landing Gear - Right Main | NMR Landing Gear - Right Wing |
      | $1,041,348.55                        | $227,901.73  | $266,803.47  | $181,926.78 | $8,096.34            | $24,144.51              | $35,289.02              | $2,076,000.00                         | $139,500.00      | $134,500.00      | $7,112.72                    | $4,000.00                    | $5,490.17               | $3,883.82                     | $2,700.00                     |

    Then verify that following values are populated in "Cash Maintenance Reserve Account Balance" section
      | Cash Maintenance Reserve (Total) | CMR Engine 1 | CMR Engine 2 | CMR APU    | CMR 20 Month C Check | CMR Heavy Maintenance 1 | CMR Heavy Maintenance 2 | CMR Engine 1 LLP | CMR Engine 2 LLP | CMR Landing Gear - Left Main | CMR Landing Gear - Left Wing | CMR Landing Gear - Nose | CMR Landing Gear - Right Main | CMR Landing Gear - Right Wing |
      | $293,548.55                      | $62,901.73   | $96,803.47   | $21,926.78 | $3,096.34            | $12,144.51              | $15,289.02              | $27,500.00       | $31,500.00       | $6,612.72                    | $2,800.00                    | $5,890.17               | $3,883.82                     | $3,200.00                     |

    And user selects newly added "C-Check-2015-06-28-8429" aircraft maintenace event
    Then verify that newly added record is displayed under section "Aircraft Maintenance Event Invoices"
      | Invoice Date | Status |
      | 7/5/2015     | Paid   |
    Then verify that following values are populated in "Assembly Maintenance Event Detail" header section
      | Actual Claim Amount |
      | $3,000.00           |

  Scenario: Verify able to add new Aircraft Eligible Event Invoice with over-claim case
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user selects newly added "C-Check-2015-06-28-8429" aircraft maintenace event
    And user clicks on "New Aircraft Maintenance Event Invoice" button
    And user fill-in "Aircraft_Maintenance_Event_Invoice" information from regression
    And user clicks on "Save" button
    And user clicks on "Edit" button
    And user fill-in aircraft "Technical details" section
      | MR Engine 1 |
      | 1500000     |
    And user clicks on "Save" button
    And user clicks on "Submit for Approval" button
    And accept browser pop-up
    And user selects newly added "Approve / Reject" link
    And user clicks on "Approve" button
    And user clicks on "Deduct From MR" button
    And verify the pop-up text "Invoice amount is higher than the Notional Maintenance Reserve Account Balance of the aircraft. This invoice cannot be paid."
    And accept browser pop-up

  Scenario: Verify able to add new Assembly Eligible Event
    When user navigates to "Assemblies" tab
    And user selects newly added "111222333" Assembly
    And user clicks on "New Assembly Maintenance Event" button
    And user fill-in "Assembly_Maintenance_Event" information from regression
    And user clicks on "Save" button
    When user navigates to "Assemblies" tab
    And user selects newly added "111222333" Assembly
    Then verify that following values are populated in "Operating Metrics" section
      | TSLV | CSLV |
      | 0.00 | 0    |

  Scenario: Verify able to add new Assembly Eligible Event Invoice
    When user navigates to "Assemblies" tab
    And user selects newly added "111222333" Assembly
    And user selects newly added "Engine Refurbishment-2015-06-28-111222333" Assembly
    And user clicks on "New Assembly Maintenance Event Invoice" button
    And user fill-in "Assembly_Maintenance_Event_Invoice" information from regression
    And user clicks on "Save" button
    And user clicks on "Submit for Approval" button
    And accept browser pop-up
    And user selects newly added "Approve / Reject" link
    And user clicks on "Approve" button
    And user clicks on "Deduct From MR" button
    And accept browser pop-up
    And user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    Then verify that following values are populated in "Notional Maintenance Reserve Account Balance" section
      | Notional Maintenance Reserve (Total) | NMR Engine 1 | NMR Engine 2 | NMR APU     | NMR 20 Month C Check | NMR Heavy Maintenance 1 | NMR Heavy Maintenance 2 | Cumulative Unpaid Maintenance Reserve | NMR Engine 1 LLP | NMR Engine 2 LLP | NMR Landing Gear - Left Main | NMR Landing Gear - Left Wing | NMR Landing Gear - Nose | NMR Landing Gear - Right Main | NMR Landing Gear - Right Wing |
      | $1,039,848.55                        | $226,901.73  | $266,803.47  | $181,926.78 | $8,096.34            | $24,144.51              | $35,289.02              | $2,076,000.00                         | $139,000.00      | $134,500.00      | $7,112.72                    | $4,000.00                    | $5,490.17               | $3,883.82                     | $2,700.00                     |

    Then verify that following values are populated in "Cash Maintenance Reserve Account Balance" section
      | Cash Maintenance Reserve (Total) | CMR Engine 1 | CMR Engine 2 | CMR APU    | CMR 20 Month C Check | CMR Heavy Maintenance 1 | CMR Heavy Maintenance 2 | CMR Engine 1 LLP | CMR Engine 2 LLP | CMR Landing Gear - Left Main | CMR Landing Gear - Left Wing | CMR Landing Gear - Nose | CMR Landing Gear - Right Main | CMR Landing Gear - Right Wing |
      | $292,048.55                      | $61,901.73   | $96,803.47   | $21,926.78 | $3,096.34            | $12,144.51              | $15,289.02              | $27,000.00       | $31,500.00       | $6,612.72                    | $2,800.00                    | $5,890.17               | $3,883.82                     | $3,200.00                     |

  Scenario: Verify able to add new Assembly Eligible Event Invoice with over-claim case
    When user navigates to "Assemblies" tab
    And user selects newly added "111222333" Assembly
    And user selects newly added "Engine Refurbishment-2015-06-28-111222333" Assembly
    And user clicks on "New Assembly Maintenance Event Invoice" button
    And user fill-in "Assembly_Maintenance_Event_Invoice" information from regression
    And user clicks on "Save" button
    And user clicks on "Edit" button
    And user fill-in aircraft "Technical details" section
      | Assembly Amount |
      | 1500000         |
    And user clicks on "Save" button
    And user clicks on "Submit for Approval" button
    And accept browser pop-up
    And user selects newly added "Approve / Reject" link
    And user clicks on "Approve" button
    And user clicks on "Deduct From MR" button
    And verify the pop-up text "Invoice amount is higher than the Notional Maintenance Reserve Account Balance of the aircraft. This invoice cannot be paid."
    And accept browser pop-up

  Scenario: Verify able to add Rent Payments for Lease using Create Rent Schedule
    When user navigates to "Leases" tab
    And user selects newly added "Orange Lease" lease
    And user clicks on "Create Rent Schedule" button
    When user navigates to "Leases" tab
    And user selects newly added "Orange Lease" lease
    And user selects newly added "Show 16 more »" link
    Then verify that newly added record is displayed under section "Rent Payments"
      | Name        | Amount Due | Date Due   | Amount Paid | Balance    |
      | 2015-12-036 | $49,500.00 | 12/10/2015 | $0.00       | $49,500.00 |
      | 2015-11-035 | $49,500.00 | 11/10/2015 | $0.00       | $49,500.00 |
      | 2015-10-034 | $49,500.00 | 10/10/2015 | $0.00       | $49,500.00 |
      | 2015-09-033 | $49,500.00 | 9/10/2015  | $0.00       | $49,500.00 |
      | 2015-08-032 | $49,500.00 | 8/10/2015  | $0.00       | $49,500.00 |
      | 2015-07-031 | $49,500.00 | 7/10/2015  | $0.00       | $49,500.00 |
      | 2015-06-030 | $49,500.00 | 6/10/2015  | $0.00       | $49,500.00 |
      | 2015-05-029 | $49,500.00 | 5/10/2015  | $0.00       | $49,500.00 |
      | 2015-04-028 | $49,500.00 | 4/10/2015  | $0.00       | $49,500.00 |
      | 2015-03-027 | $49,500.00 | 3/10/2015  | $0.00       | $49,500.00 |
      | 2015-02-026 | $49,500.00 | 2/10/2015  | $0.00       | $49,500.00 |
      | 2015-01-025 | $49,500.00 | 1/10/2015  | $0.00       | $49,500.00 |
      | 2014-12-024 | $49,500.00 | 12/10/2014 | $0.00       | $49,500.00 |
      | 2014-11-023 | $49,500.00 | 11/10/2014 | $0.00       | $49,500.00 |
      | 2014-10-022 | $49,500.00 | 10/10/2014 | $0.00       | $49,500.00 |
      | 2014-09-021 | $49,500.00 | 9/10/2014  | $0.00       | $49,500.00 |
      | 2014-08-020 | $49,500.00 | 8/10/2014  | $0.00       | $49,500.00 |
      | 2014-07-019 | $49,500.00 | 7/10/2014  | $0.00       | $49,500.00 |
      | 2014-06-018 | $49,500.00 | 6/10/2014  | $0.00       | $49,500.00 |
      | 2014-05-017 | $49,500.00 | 5/10/2014  | $0.00       | $49,500.00 |
      | 2014-04-016 | $49,500.00 | 4/10/2014  | $0.00       | $49,500.00 |
      | 2014-03-015 | $49,500.00 | 3/10/2014  | $0.00       | $49,500.00 |
      | 2014-02-014 | $49,500.00 | 2/10/2014  | $0.00       | $49,500.00 |
      | 2014-01-013 | $49,500.00 | 1/10/2014  | $0.00       | $49,500.00 |
      | 2013-12-012 | $49,500.00 | 12/10/2013 | $0.00       | $49,500.00 |
      | 2013-11-011 | $49,500.00 | 11/10/2013 | $0.00       | $49,500.00 |
      | 2013-10-010 | $49,500.00 | 10/10/2013 | $0.00       | $49,500.00 |
      | 2013-09-009 | $49,500.00 | 9/10/2013  | $0.00       | $49,500.00 |
      | 2013-08-008 | $49,500.00 | 8/10/2013  | $0.00       | $49,500.00 |
      | 2013-07-007 | $49,500.00 | 7/10/2013  | $0.00       | $49,500.00 |
      | 2013-06-006 | $49,500.00 | 6/10/2013  | $0.00       | $49,500.00 |
      | 2013-05-005 | $49,500.00 | 5/10/2013  | $0.00       | $49,500.00 |
      | 2013-04-004 | $49,500.00 | 4/10/2013  | $0.00       | $49,500.00 |
      | 2013-03-003 | $49,500.00 | 3/10/2013  | $0.00       | $49,500.00 |
      | 2013-02-002 | $49,500.00 | 2/10/2013  | $0.00       | $49,500.00 |
      | 2013-01-001 | $49,500.00 | 1/10/2013  | $0.00       | $49,500.00 |

  Scenario: Verify able to add Rent Invoice for Lease
    When user navigates to "Leases" tab
    And user selects newly added "Orange Lease" lease
    And user clicks on "New Invoice" button
    And user select "Rent" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "Rent_Invoice" information from regression
    And user clicks on "Save" button
    When user navigates to "Leases" tab
    And user selects newly added "Orange Lease" lease
    Then verify that newly added record is displayed under section "Invoices"
      | Invoice Name | For Period Ending | Amount Due    | Invoiced Amount | Amount Paid | Balance Due   | Invoice Date | Invoice Type |
      | 8429-A003-MR | 3/31/2013         | $2,076,000.00 | $2,000,000.00   | $100,000.00 | $1,900,000.00 | TODAYS_DATE | Aircraft MR  |
      | 8429-A001-R  | 1/31/2013         | $49,500.00    | $49,500.00      | $0.00       | $49,500.00    | 5/1/2015     | Rent         |

  Scenario: Verify negative scenarios for Monthly Utilization
  o Two Monthly Utilizations for same month
  o Monthly Utilization for future date
  o Monthly Utilization for a date prior to last Monthly Utilization
  o Monthly Utilization for a date which is not month ending

    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user clicks on "New Monthly Utilization" button
    And user fill-in aircraft "Technical details" section
      | For Month Ending | Airframe Flight Hours (FH) | Airframe Flight Cycles (FC) |
      | 03/31/2013       | 100                        | 50                          |
    And user clicks on "Save" button
    Then verify following error message is displayed "A utilization report for this month has already been filed. You cannot file another one for the same month unless it is a True Up or an Estimated one."
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user clicks on "New Monthly Utilization" button
    And user fill-in aircraft "Technical details" section
      | For Month Ending | Airframe Flight Hours (FH) | Airframe Flight Cycles (FC) |
      | 03/31/2018       | 100                        | 50                          |
    And user clicks on "Save" button
    Then verify following field level error message is displayed "Utilization report cannot be filed for future months."
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user clicks on "New Monthly Utilization" button
    And user fill-in aircraft "Technical details" section
      | For Month Ending | Airframe Flight Hours (FH) | Airframe Flight Cycles (FC) |
      | 02/28/2013       | 100                        | 50                          |
    And user clicks on "Save" button
    Then verify following error message is displayed "A new Utilization Report can be created only for month 4/2013 or after."
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user clicks on "New Monthly Utilization" button
    And user fill-in aircraft "Technical details" section
      | For Month Ending | Airframe Flight Hours (FH) | Airframe Flight Cycles (FC) |
      | 05/30/2013       | 100                        | 50                          |
    And user clicks on "Save" button
    Then verify following field level error message is displayed "Month ending day has to be the last day of the month"

  Scenario: Verify able to Generate Aircraft Spec Sheet
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user clicks on "Generate Spec Sheet" button
    And user fill-in aircraft "Technical details" section
      | Email              |
      | nanthalw@gmail.com |
    And user clicks on "Send PDF" button
    Then verify following message is displayed "Email with spec sheet sent to nanthalw@gmail.com"
    And user clicks on "Logout" link

  @clear_data
  Scenario: Verify that able to clear Invoice
    When user navigates to "Invoices" tab
    And user selects newly added "8429-A001-R" lease
    And user clicks on "Delete" button
    And accept browser pop-up

  @clear_data
  Scenario: Verify that able to clear Lease
    When user navigates to "Leases" tab
    And user selects newly added "Orange Lease" lease
    And user clicks on "Edit" button
    And user fill-in aircraft "Technical details" section
      | Aircraft |
      |          |
    And user clicks on "Save" button
    And user clicks on "Delete" button
    And accept browser pop-up

  @clear_data
  Scenario: Verify that able to clear Aircraft
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user clicks on "Delete" button
    And accept browser pop-up

  @clear_data
  Scenario: Verify that able to clear Assemblies
    When user navigates to "Assemblies" tab
    And user selects newly added "111222333" assembly
    And user clicks on "Delete" button
    And accept browser pop-up

    And user selects newly added "88844433A" assembly
    And user clicks on "Delete" button
    And accept browser pop-up

    And user selects newly added "333444555" assembly
    And user clicks on "Delete" button
    And accept browser pop-up

    And user selects newly added "222000777" assembly
    And user clicks on "Delete" button
    And accept browser pop-up

    And user selects newly added "250033322" assembly
    And user clicks on "Delete" button
    And accept browser pop-up

    And user selects newly added "432675588" assembly
    And user clicks on "Delete" button
    And accept browser pop-up

    And user selects newly added "66600088A" assembly
    And user clicks on "Delete" button
    And accept browser pop-up

    And user selects newly added "533894888" assembly
    And user clicks on "Delete" button
    And accept browser pop-up

  @clear_data
  Scenario: Verify that able to clear Operator
    When user navigates to "Operators" tab
    And user selects newly added "OrangeAir" lease
    And user clicks on "Delete" button
    And accept browser pop-up

  @clear_data
  Scenario: Verify that able to clear Aircraft Condition Terms
    When user navigates to "Aircraft Condition Terms" tab
    And user selects newly added "Orange Return" lease
    And user clicks on "Delete" button
    And accept browser pop-up

  @clear_data
  Scenario: Verify that able to clear Maintenance Program
    When user navigates to "Maintenance Program" tab
    And user selects newly added "Maintenance_100" lease
    And user clicks on "Delete" button
    And accept browser pop-up

  @clear_data
  Scenario: Verify that able to clear Interpolation table
    When user navigates to "Interpolation Table" tab
    And user selects newly added "ratio_table_300" lease
    And user clicks on "Delete" button
    And accept browser pop-up