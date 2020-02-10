  Feature: Data integrity check
  
  As a System Admin of the Lego(R) Part Warehouse
  I would like to perform a data integrity check
  So that I can confirm the accuracy and consistency of the system data
  
  Scenario: Perform a data integrity check on the system (Normal Flow)
    Given I am logged in as user Charbel
      And I have System Admin privileges
     When I request a data integrity check
     Then the system should return a report on the data integrity of the system
  