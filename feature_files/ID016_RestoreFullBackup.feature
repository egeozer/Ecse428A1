  Feature: Restore full system backup
  
  As a System Admin of the Lego(R) Part Warehouse
  I would like to Restore from a full system backup
  So that I can restore the system to a previous functional state in case of a failure
  
  Scenario: Restore from a full system backup (Normal Flow)
    Given the following backup entries are registered in the system:
      | Date     | Size   | Created By | Status     | 
      | 2/2/2020 | 700 TB | Charbel    | Functional | 
  
    Given I am logged in as user Charbel
      And I have System Admin privileges
     When I request to restore the latest full system backup
     Then the system should restore the full system backup linked to the database entry
  
  Scenario: Restore from a corrupted full system backup (Alternate Flow)
    Given the following backup entries are registered in the system:
      | Date     | Size   | Created By | Status    | 
      | 2/2/2020 | 700 TB | Charbel    | Corrupted | 
  
    Given I am logged in as user Charbel
      And I have System Admin privileges
     When I request to restore the latest full system backup
     Then the system should not restore the backup
      And the system should display an error message notifying me that the backup is Corrupted
  
  