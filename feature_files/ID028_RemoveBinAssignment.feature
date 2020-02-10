  Feature: Remove part bin assignment
  
  As a Inventory Manager of the Lego(R) Part Warehouse
  I would like to remove the bin assignment on a part
  So that I can redirect the part to another bin
  
  Background: 
    Given I am logged in as an inventory manager
  
  Scenario: Removing a bin assignment on a part (Normal Flow)
    Given the part already has a bin assignment
     When the request to remove the assignment is made
     Then the system should remove the bin assignment from the part
  
  Scenario: Removing an unexisting bin assignment on a part (Error Flow)
    Given the part has no existing bin assignment
     When the request to remove the assignment is made
     Then the system should deny the request
      And an error message should display "Error, the part has no bin assignment"
  
