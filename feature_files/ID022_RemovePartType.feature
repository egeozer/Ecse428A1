  Feature: Remove part type
  
  As a Inventory Manager of the Lego(R) Part Warehouse
  I would like to remove a part type
  So that I can get rid of a specific type if it is not required anymore
  
  Background: 
    Given I am logged in as an inventory manager
  
  Scenario: Removing a type form a valid part (Normal Flow)
    Given the part already possess a type
     When the request to remove the type is made 
     Then the part type is erased
  
  Scenario: Removing a type from a part that has none (Error Flow)
    Given the part has no type
     When the request to remove the type is made
     Then the system should not treat the request
      And an error message should display "Error, part has no existing type"
