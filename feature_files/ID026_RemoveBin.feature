  Feature: Remove Bin
  
  As a Inventory Manager of the Lego(R) Part Warehouse
  I would like to remove a bin
  So that I can remove an existing bin along with its part type when necessary
  
  Background: 
    Given I am logged in as an inventory manager
  
  Scenario: Removing a bin (Normal Flow)
     When the request to remove the bin is made
     Then the system should remove the bin
      And the system should erase the bin assignments for the parts that were in the bin
  
  Scenario: Removing an unexisting bin (Error Flow)
    Given no existing bin corresponds to the requested bin
     When the request to remove the bin is made
     Then the system should not treat the request
      And an error message should display "Error, no existing bin found to remove"
