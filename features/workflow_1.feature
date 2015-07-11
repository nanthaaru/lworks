Feature: To verify Regression scenarios to test Application flow

  Background:
    When user logins and navigates to home page

  Scenario: Verify able to add new Aircraft
    When user navigates to "Aircraft" tab
    And user clicks on "New" button
    And user fill-in "Aircraft" information from regression
    And user clicks on "Save" button
    And user navigates to "Aircraft" tab
    Then verify that newly added record is displayed in the page
      | Aircraft Name | MSN  | Aircraft Type | Status    |
      | 8429 (A340)   | 8429 | A340          | Available |

  Scenario: Verify able to add new Engine-1 Assembly
    When user navigates to "Assemblies" tab
    And user clicks on "New" button
    And user select "Engine" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "Assemblies_Engine_1" information from regression
    And user clicks on "Save" button
    And user navigates to "Assemblies" tab
    Then verify that newly added record is displayed in the page
      | Constituent Assembly Name |
      | 111222333                 |

  Scenario: Verify able to add new Engine-2 Assembly
    When user navigates to "Assemblies" tab
    And user clicks on "New" button
    And user select "Engine" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "Assemblies_Engine_2" information from regression
    And user clicks on "Save" button
    And user navigates to "Assemblies" tab
    Then verify that newly added record is displayed in the page
      | Constituent Assembly Name |
      | 88844433A                 |

  Scenario: Verify able to add new APU Assembly
    When user navigates to "Assemblies" tab
    And user clicks on "New" button
    And user select "APU" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "Assemblies_APU" information from regression
    And user clicks on "Save" button
    And user navigates to "Assemblies" tab
    Then verify that newly added record is displayed in the page
      | Constituent Assembly Name |
      | 333444555                 |

  Scenario: Verify able to add new Landing Gear Left Assembly
    When user navigates to "Assemblies" tab
    And user clicks on "New" button
    And user select "Landing Gear" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "LandingGear_Left" information from regression
    And user clicks on "Save" button
    And user navigates to "Assemblies" tab
    Then verify that newly added record is displayed in the page
      | Constituent Assembly Name |
      | 222000777                 |

  Scenario: Verify able to add new Landing Gear Right Assembly
    When user navigates to "Assemblies" tab
    And user clicks on "New" button
    And user select "Landing Gear" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "LandingGear_Right" information from regression
    And user clicks on "Save" button
    And user navigates to "Assemblies" tab
    Then verify that newly added record is displayed in the page
      | Constituent Assembly Name |
      | 250033322                 |

  Scenario: Verify able to add new Landing Gear Center Assembly
    When user navigates to "Assemblies" tab
    And user clicks on "New" button
    And user select "Landing Gear" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "LandingGear_Center" information from regression
    And user clicks on "Save" button
    And user navigates to "Assemblies" tab
    Then verify that newly added record is displayed in the page
      | Constituent Assembly Name |
      | 511090888                 |

  Scenario: Verify able to add new Landing Gear Nose Assembly
    When user navigates to "Assemblies" tab
    And user clicks on "New" button
    And user select "Landing Gear" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "LandingGear_Nose" information from regression
    And user clicks on "Save" button
    And user navigates to "Assemblies" tab
    Then verify that newly added record is displayed in the page
      | Constituent Assembly Name |
      | 432675588                 |

  Scenario: Verify able to add new Landing Gear Left Wing Assembly
    When user navigates to "Assemblies" tab
    And user clicks on "New" button
    And user select "Landing Gear" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "LandingGear_Left_Wing" information from regression
    And user clicks on "Save" button
    And user navigates to "Assemblies" tab
    Then verify that newly added record is displayed in the page
      | Constituent Assembly Name |
      | 66600088A                 |

  Scenario: Verify able to add new Landing Gear Right Wing Assembly
    When user navigates to "Assemblies" tab
    And user clicks on "New" button
    And user select "Landing Gear" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "LandingGear_Right_Wing" information from regression
    And user clicks on "Save" button
    And user navigates to "Assemblies" tab
    Then verify that newly added record is displayed in the page
      | Constituent Assembly Name |
      | 533894888                 |

  Scenario: Verify able to add new Operator
    When user navigates to "Operators" tab
    And user clicks on "New" button
    And user fill-in "Operators" information from regression
    And user clicks on "Save" button
    And user navigates to "Operators" tab
    Then verify that newly added record is displayed in the page
      | Operator Name | Revenue       | Total Number Of Aircraft |
      | OrangeAir     | $4,230,000.00 | 12                       |

  Scenario: Verify able to add new Lease for Aircraft
    When user navigates to "Leases" tab
    And user clicks on "New" button
    And user select "Aircraft" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "Lease_Aircraft" information from regression
    And user clicks on "Save" button
    And user navigates to "Leases" tab
    Then verify that newly added record is displayed in the page
      | Lease Name   |
      | Orange Lease |
    And user navigates to "Aircraft" tab
    Then verify that Aircraft status is changed to assigned
      | Aircraft Name | MSN  | Aircraft Type | Status   |
      | 8429 (A340)   | 8429 | A340          | Assigned |

  Scenario: Verify able to add new Ratio table
    When user navigates to "Interpolation Table" tab
    And user clicks on "New" button
    And user fill-in "Ratio_Table" information from regression
    And user clicks on "Save" button
    When user navigates to "Interpolation Table" tab
#    Then verify that newly added record is displayed in the page
#      | Interpolation Table Name |
#      | ratio_table_300          |
    And user selects newly added "ratio_table_300" ratio table
    And user clicks on "New Interpolation Adjustment" button
    And user fill-in "Interpolation_Adjustment" information from regression
    And user clicks on "Save" button
    When user navigates to "Interpolation Table" tab
    And user selects newly added "ratio_table_300" ratio table
    Then verify that newly added record is displayed under section "Interpolation Adjustments"
      | Interpolation Adjustment Name | Derate Percentage | FH To FC Ratio | Adjustment Factor |
      | Adjust_200                    | 5                 | 10.00          | 30.0000           |

  Scenario: Verify able to add new Return Conditions
    When user navigates to "Aircraft Condition Terms" tab
    And user clicks on "New" button
    And user fill-in "Return_Conditions" information from regression
    And user clicks on "Save" button
    And user navigates to "Aircraft Condition Terms" tab
    Then verify that newly added record is displayed in the page
      | Aircraft Condition Terms Name |
      | Orange Return                 |

  Scenario: Verify able to update lease with Ratio Table and Return Conditions
    When user navigates to "Leases" tab
    And user selects newly added "Orange Lease" lease
    And user clicks on "Edit" button
    And user fill-in aircraft "Ratio Table & Return Condition" section
      | Ratio Table - Engines | Return Condition |
      | ratio_table_300       | Orange Return    |
    And user clicks on "Save" button
    Then verify that following values are populated in "Interpolation Table" section
      | Ratio Table - Engines | Return Condition |
      | ratio_table_300       | Orange Return    |

  Scenario: Verify able to add new Maintenance Program
    When user navigates to "Maintenance Program" tab
    And user clicks on "New" button
    And user fill-in "Maintenance_Program" information from regression
    And user clicks on "Save" button
    And user navigates to "Home" tab
    And user navigates to "Maintenance Program" tab
    Then verify that newly added record is displayed in the page
      | Maintenance Program Name |
      | Maintenance_100          |

  Scenario: Verify able to add new Maintenance Program Event
    When user navigates to "Maintenance Program" tab
    And user selects newly added "Maintenance_100" lease
    And user clicks on "New Maintenance Program Event" button
    And user fill-in "Maintenance_Program_Event" information from regression
    And user clicks on "Save" button
    And user navigates to "Maintenance Program" tab
    And user selects newly added "Maintenance_100" lease
    Then verify that newly added record is displayed under section "Maintenance Program Event"
      | Event Type | Other Details  | Cycles | Hours | Months |
      | Heavy 1    | Engine Service | 120    | 800   | 3      |

  Scenario: Verify able to add new Monthly Utilization for Aircraft
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user clicks on "New Monthly Utilization" button
    And user fill-in "Monthly_Utilization" information from regression
    And user clicks on "Save" button
    Then verify that Assembly Utilizations are auto created
      | Report Item Type          | TSN      | CSN      | Running Hours During Month | Cycles During Month |
      | Engine 1                  | 5,000.00 | 3,000.00 | 300.00                     | 50                  |
      | Engine 2                  | 4,800.00 | 3,200.00 | 300.00                     | 50                  |
      | APU                       | 5,000.00 | 3,000.00 | 300.00                     | 50                  |
      | Landing Gear - Left Main  | 2,200.00 | 1,600.00 | 300.00                     | 50                  |
      | Landing Gear - Right Main | 5,000.00 | 2,500.00 | 300.00                     | 50                  |
      | Landing Gear - Center     | 5,000.00 | 2,500.00 | 300.00                     | 50                  |
      | Landing Gear - Nose       | 5,000.00 | 2,500.00 | 300.00                     | 50                  |
      | Landing Gear - Left Wing  | 5,000.00 | 2,500.00 | 300.00                     | 50                  |
      | Landing Gear - Right Wing | 5,000.00 | 2,500.00 | 300.00                     | 50                  |

    Then verify that following values are populated in "Base Maintenance Reserve Rates" section
      | Base MRR Engine 1 | Base MRR Engine 2 | Base MRR APU | Base MRR Other | Base MRR Airframe Heavy Maintenance 1 | Base MRR Airframe Heavy Maintenance 2 | Base MRR C Check | LLP MR Escalation (Lease) | General MR Escalation (Lease) | LLP Escalation Factor | General Escalation Factor |
      | $3,000.00         | $3,000.00         | $100.00      | $5,000.00      | $3,000.00                             | $6,000.00                             | $2,000.00        | 200.00%                   | 100.00%                       | 1.0000                | 1.0000                    |

    Then verify that following values are populated in "Effective Maintenance Reserve Rates" section
      | Effective MRR Engine 1 | Effective MRR Engine 2 | Effective MRR APU | Effective MRR Landing Gear - Left Main | Effective MRR Landing Gear - Right Main | Effective MRR Landing Gear - Left Wing | Effective MRR Landing Gear - Right Wing | Effective MRR Landing Gear - Nose |
      | $3,000.00              | $3,000.00              | $100.00           | $1,000.00                              | $300.00                                 | $500.00                                | $400.00                                 | $800.00                           |

    Then verify that following values are populated in "Maintenance Reserves" section
      | Total Maintenance Reserve | Engine 1    | Engine 2    | APU        | C Check   | Heavy Maint 1 Airframe | Heavy Maint 2 Airframe | Landing Gear - Left Main | Landing Gear - Right Main | Landing Gear - Nose | Landing Gear - Left Wing | Landing Gear - Right Wing | Landing Gear Total |
      | $1,991,000.00             | $900,000.00 | $900,000.00 | $30,000.00 | $2,000.00 | $3,000.00              | $6,000.00              | $50,000.00               | $15,000.00                | $40,000.00          | $25,000.00               | $20,000.00                | $150,000.00        |

  Scenario: Verify that on updaitng FH & FC in Aircraft Monthly Utilization updates Assembly Utilization and MR
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user selects newly added "2013-03-003" monthly utilization
    And user clicks on "Edit" button
    And user fill-in aircraft "FH & FC" section
      | Airframe Flight Hours (FH) | Airframe Flight Cycles (FC) |
      | 300                        | 50                          |
    And user clicks on "Save" button
    Then verify that following values are populated in "Airframe Utilization" section
      | Airframe Flight Hours (FH) | Airframe Flight Cycles (FC) |
      | 300                        | 50                          |
    Then verify that Assembly Utilizations are auto created
      | Report Item Type          | TSN      | CSN      | Running Hours During Month | Cycles During Month |
      | Engine 1                  | 5,000.00 | 3,000.00 | 300.00                     | 50                  |
      | Engine 2                  | 4,800.00 | 3,200.00 | 300.00                     | 50                  |
      | APU                       | 5,000.00 | 3,000.00 | 300.00                     | 50                  |
      | Landing Gear - Left Main  | 2,200.00 | 1,600.00 | 300.00                     | 50                  |
      | Landing Gear - Right Main | 5,000.00 | 2,500.00 | 300.00                     | 50                  |
      | Landing Gear - Center     | 5,000.00 | 2,500.00 | 300.00                     | 50                  |
      | Landing Gear - Nose       | 5,000.00 | 2,500.00 | 300.00                     | 50                  |
      | Landing Gear - Left Wing  | 5,000.00 | 2,500.00 | 300.00                     | 50                  |
      | Landing Gear - Right Wing | 5,000.00 | 2,500.00 | 300.00                     | 50                  |

    Then verify that following values are populated in "Base Maintenance Reserve Rates" section
      | Base MRR Engine 1 | Base MRR Engine 2 | Base MRR APU | Base MRR Other | Base MRR Airframe Heavy Maintenance 1 | Base MRR Airframe Heavy Maintenance 2 | Base MRR C Check | LLP MR Escalation (Lease) | General MR Escalation (Lease) | LLP Escalation Factor | General Escalation Factor |
      | $3,000.00         | $3,000.00         | $100.00      | $5,000.00      | $3,000.00                             | $6,000.00                             | $2,000.00        | 200.00%                   | 100.00%                       | 1.0000                | 1.0000                    |

    Then verify that following values are populated in "Effective Maintenance Reserve Rates" section
      | Effective MRR Engine 1 | Effective MRR Engine 2 | Effective MRR APU | Effective MRR Landing Gear - Left Main | Effective MRR Landing Gear - Right Main | Effective MRR Landing Gear - Left Wing | Effective MRR Landing Gear - Right Wing | Effective MRR Landing Gear - Nose |
      | $3,000.00              | $3,000.00              | $100.00           | $1,000.00                              | $300.00                                 | $500.00                                | $400.00                                 | $800.00                           |

    Then verify that following values are populated in "Maintenance Reserves" section
      | Total Maintenance Reserve | Engine 1    | Engine 2    | APU        | C Check   | Heavy Maint 1 Airframe | Heavy Maint 2 Airframe | Landing Gear - Left Main | Landing Gear - Right Main | Landing Gear - Nose | Landing Gear - Left Wing | Landing Gear - Right Wing | Landing Gear Total |
      | $1,991,000.00             | $900,000.00 | $900,000.00 | $30,000.00 | $2,000.00 | $3,000.00              | $6,000.00              | $50,000.00               | $15,000.00                | $40,000.00          | $25,000.00               | $20,000.00                | $150,000.00        |

    And user selects assembly utilization "Engine 1"

    Then verify that following values are populated in "Reserve Calculations" section
      | Maintenance Reserve (Assembly) | Total MR (Assembly) |
      | $900,000.00                    | $900,000.00         |

  Scenario: Verify that on updating FH & FC in Assembly Utilization updates Assembly Utilization and MR
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user selects newly added "2013-03-003" monthly utilization
    And user selects assembly utilization "Engine 1"
    And user clicks on "Edit" button
    And user fill-in aircraft "FH & FC" section
      | Running Hours During Month | Cycles During Month |
      | 200                        | 25                  |
    And user clicks on "Save" button
#    Then verify that following values are populated in "Assembly Utilization Detail" section
#      | Running Hours During Month | Cycles During Month |
#      | 200                        | 25                  |

    Then verify that following values are populated in "Reserve Calculations" section
      | Maintenance Reserve (Assembly) | Total MR (Assembly) |
      | $600,000.00                    | $600,000.00         |

    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user selects newly added "2013-03-003" monthly utilization
    Then verify that following values are populated in "Airframe Utilization" section
      | Airframe Flight Hours (FH) | Airframe Flight Cycles (FC) |
      | 300                        | 50                          |

    Then verify that Assembly Utilizations are auto created
      | Report Item Type | TSN      | CSN      | Running Hours During Month | Cycles During Month |
      | Engine 1         | 5,000.00 | 3,000.00 | 200.00                     | 25                  |

    Then verify that following values are populated in "Base Maintenance Reserve Rates" section
      | Base MRR Engine 1 | Base MRR Engine 2 | Base MRR APU | Base MRR Other | Base MRR Airframe Heavy Maintenance 1 | Base MRR Airframe Heavy Maintenance 2 | Base MRR C Check | LLP MR Escalation (Lease) | General MR Escalation (Lease) | LLP Escalation Factor | General Escalation Factor |
      | $3,000.00         | $3,000.00         | $100.00      | $5,000.00      | $3,000.00                             | $6,000.00                             | $2,000.00        | 200.00%                   | 100.00%                       | 1.0000                | 1.0000                    |

    Then verify that following values are populated in "Effective Maintenance Reserve Rates" section
      | Effective MRR Engine 1 | Effective MRR Engine 2 | Effective MRR APU | Effective MRR Landing Gear - Left Main | Effective MRR Landing Gear - Right Main | Effective MRR Landing Gear - Left Wing | Effective MRR Landing Gear - Right Wing | Effective MRR Landing Gear - Nose |
      | $3,000.00              | $3,000.00              | $100.00           | $1,000.00                              | $300.00                                 | $500.00                                | $400.00                                 | $800.00                           |

    Then verify that following values are populated in "Maintenance Reserves" section
      | Total Maintenance Reserve | Engine 1    | Engine 2    | APU        | C Check   | Heavy Maint 1 Airframe | Heavy Maint 2 Airframe | Landing Gear - Left Main | Landing Gear - Right Main | Landing Gear - Nose | Landing Gear - Left Wing | Landing Gear - Right Wing | Landing Gear Total |
      | $1,691,000.00             | $600,000.00 | $900,000.00 | $30,000.00 | $2,000.00 | $3,000.00              | $6,000.00              | $50,000.00               | $15,000.00                | $40,000.00          | $25,000.00               | $20,000.00                | $150,000.00        |

  #TC 18
  Scenario: Verify that on updating FH & FC in Monthly Utilization,
  it doesn't update Assembly FH & FC which was updated in Assembly utilization.
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user selects newly added "2013-03-003" monthly utilization
    And user clicks on "Edit" button
    And user fill-in aircraft "FH & FC" section
      | Airframe Flight Hours (FH) | Airframe Flight Cycles (FC) |
      | 400                        | 75                          |
    And user clicks on "Save" button
    Then verify that Assembly Utilizations are auto created
      | Report Item Type          | TSN      | CSN      | Running Hours During Month | Cycles During Month |
      | Engine 2                  | 4,800.00 | 3,200.00 | 400.00                     | 75                  |
      | APU                       | 5,000.00 | 3,000.00 | 400.00                     | 75                  |
      | Landing Gear - Left Main  | 2,200.00 | 1,600.00 | 400.00                     | 75                  |
      | Landing Gear - Right Main | 5,000.00 | 2,500.00 | 400.00                     | 75                  |
      | Landing Gear - Center     | 5,000.00 | 2,500.00 | 400.00                     | 75                  |
      | Landing Gear - Nose       | 5,000.00 | 2,500.00 | 400.00                     | 75                  |
      | Landing Gear - Left Wing  | 5,000.00 | 2,500.00 | 400.00                     | 75                  |
      | Landing Gear - Right Wing | 5,000.00 | 2,500.00 | 400.00                     | 75                  |
      | Engine 1                  | 5,000.00 | 3,000.00 | 200.00                     | 25                  |


  Scenario: Verify that on Approving Monthly Utilization TSN and CSN on Aircraft gets updated
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    Then verify that following values are populated in "Operational Metrics" section
      | TSN      | CSN   |
      | 7,000.00 | 4,000 |

    And user selects newly added "2013-03-003" monthly utilization
    And user clicks on "Edit" button
    And user fill-in aircraft "Status to Approval" section
      | Status             |
      | Approved By Lessor |
    And user clicks on "Save" button
    And user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    Then verify that following values are populated in "Operational Metrics" section
      | TSN      | CSN   |
      | 7,400.00 | 4,075 |

  Scenario: Verify that after Monthly Utilization approval will not be able to update Monthly Utilization FH & FC
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user selects newly added "2013-03-003" monthly utilization
    And user clicks on "Edit" button
    And user fill-in aircraft "FH & FC" section
      | Airframe Flight Hours (FH) | Airframe Flight Cycles (FC) |
      | 250                        | 40                          |
    And user clicks on "Save" button

    Then verify following error message is displayed "Approval status and Utilization cannot be changed once the report is approved."


  Scenario: Verify that on Creating Invoice and Payment NMR/CMR of Aircraft is updated.
    When user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    Then verify that following values are populated in "Notional Maintenance Reserve Account Balance" section
      | Notional Maintenance Reserve (Total) | NMR Engine 1 | NMR Engine 2 | NMR APU     | NMR 20 Month C Check | NMR Heavy Maintenance 1 | NMR Heavy Maintenance 2 | Cumulative Unpaid Maintenance Reserve | NMR Engine 1 LLP | NMR Engine 2 LLP | NMR Landing Gear - Left Main | NMR Landing Gear - Left Wing | NMR Landing Gear - Nose | NMR Landing Gear - Right Main | NMR Landing Gear - Right Wing |
      | $947,600.00                          | $200,000.00  | $210,000.00  | $180,000.00 | $8,000.00            | $24,000.00              | $35,000.00              | $2,076,000.00                         | $140,000.00      | $135,000.00      | $3,500.00                    | $4,000.00                    | $2,600.00               | $2,800.00                     | $2,700.00                     |

    Then verify that following values are populated in "Cash Maintenance Reserve Account Balance" section
      | Cash Maintenance Reserve (Total) | CMR Engine 1 | CMR Engine 2 | CMR APU    | CMR 20 Month C Check | CMR Heavy Maintenance 1 | CMR Heavy Maintenance 2 | CMR Engine 1 LLP | CMR Engine 2 LLP | CMR Landing Gear - Left Main | CMR Landing Gear - Left Wing | CMR Landing Gear - Nose | CMR Landing Gear - Right Main | CMR Landing Gear - Right Wing |
      | $199,800.00                      | $35,000.00   | $40,000.00   | $20,000.00 | $3,000.00            | $12,000.00              | $15,000.00              | $28,000.00       | $32,000.00       | $3,000.00                    | $2,800.00                    | $3,000.00               | $2,800.00                     | $3,200.00                     |

    And user selects newly added "2013-03-003" monthly utilization
    And user clicks on "New Invoice" button
    And user select "Aircraft MR" for "Record Type of new record"
    And user clicks on "Continue" button
    And user fill-in "Invoice_Aircraft" information from regression
    And user clicks on "Save" button
    And user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft
    And user selects newly added "2013-03-003" monthly utilization
    Then verify that newly added record is displayed under section "Invoices"
      | Invoice Name |
      | 8429-A003-R  |
    And user selects newly added "8429-A003-MR" Invoice
    And user clicks on "New Payment" button
    And user fill-in "Payment" information from regression
    And user clicks on "Save" button
    And user navigates to "Aircraft" tab
    And user selects newly added "8429 (A340)" aircraft

    Then verify that following values are populated in "Notional Maintenance Reserve Account Balance" section
      | Notional Maintenance Reserve (Total) | NMR Engine 1 | NMR Engine 2 | NMR APU     | NMR 20 Month C Check | NMR Heavy Maintenance 1 | NMR Heavy Maintenance 2 | Cumulative Unpaid Maintenance Reserve | NMR Engine 1 LLP | NMR Engine 2 LLP | NMR Landing Gear - Left Main | NMR Landing Gear - Left Wing | NMR Landing Gear - Nose | NMR Landing Gear - Right Main | NMR Landing Gear - Right Wing |
      | $1,044,348.55                        | $228,901.73  | $267,803.47  | $181,926.78 | $8,096.34            | $24,144.51              | $35,289.02              | $2,076,000.00                         | $140,000.00      | $135,000.00      | $7,112.72                    | $4,000.00                    | $5,490.17               | $3,883.82                     | $2,700.00                     |

    Then verify that following values are populated in "Cash Maintenance Reserve Account Balance" section
      | Cash Maintenance Reserve (Total) | CMR Engine 1 | CMR Engine 2 | CMR APU    | CMR 20 Month C Check | CMR Heavy Maintenance 1 | CMR Heavy Maintenance 2 | CMR Engine 1 LLP | CMR Engine 2 LLP | CMR Landing Gear - Left Main | CMR Landing Gear - Left Wing | CMR Landing Gear - Nose | CMR Landing Gear - Right Main | CMR Landing Gear - Right Wing |
      | $296,548.55                      | $63,901.73   | $97,803.47   | $21,926.78 | $3,096.34            | $12,144.51              | $15,289.02              | $28,000.00       | $32,000.00       | $6,612.72                    | $2,800.00                    | $5,890.17               | $3,883.82                     | $3,200.00                     |

    And user selects newly added "2013-03-003" monthly utilization
    And user selects newly added "8429-A003-MR" Invoice
    Then verify that newly added record is displayed under section "Payments"
      | Payment Name        | Amount      |
      | Aircraft MR-2015-07 | $100,000.00 |

