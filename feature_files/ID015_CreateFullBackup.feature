  Feature: Create full system backup
  
  As a System Admin of the Lego(R) Part Warehouse
  I would like to perform a full system backup
  So that I can ensure the safety of critical system data
  
  Scenario: Perform a full system backup (Normal Flow)
  
    Given I am logged in as user Charbel
      And I have System Admin privileges
     When I request a full system backup
     Then the system should create a full system backup
      And the system should create a backup entry in the backup database with the date and System Admin name
  
  Scenario: Perform a full system backup without enough space (Alternate Flow)
  
    Given I am logged in as user Charbel
      And I have System Admin privileges
      And the datacenter remaining memory is low
     When I request a full system backup
     Then the system should not attempt to create a backup
      And the system should display an error message notifying me that the there is not enough memory for a full system backup
  
  