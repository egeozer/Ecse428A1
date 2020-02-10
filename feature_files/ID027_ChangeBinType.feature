  Feature: Change Bin Type
  
  As a Inventory Manager of the Lego(R) Part Warehouse
  I would like to change the type of a bin
  So that I can change the unique part type that can be stored in the bin
  
  Background: 
    Given I am logged in as an inventory manager
  
  Scenario: Changing a bin's type (Normal Flow)
    Given the bin has no parts inside of it
     When the request to change its type is made
     Then the system should change the bin's type
  
  Scenario: Changing a non-empty bin's type (Alternative Flow)
    Given the bin has parts assigned to it
     When When the request to change its type is made
     Then the system should erase the bin assignments of the parts that were assigned to it
      And the system should change the bin's type
  
  Scenario: Changing to a non-valid bin type (Error Flow)
    Given the new type contains the characters "%*$!"
     When the request to change the bin type is made
     Then the system should not treat the request
      And an error message should display "Error, Invalid character in the type"
  
