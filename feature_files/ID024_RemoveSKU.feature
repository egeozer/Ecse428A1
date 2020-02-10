  Feature: Remove SKU from a part
  
  As a Inventory Manager of the Lego(R) Part Warehouse
  I would like to remove a SKU from a part
  So that I can delete the part's ID if necessary
  
  Background: 
    Given I am logged in as an inventory manager
  
  Scenario: Removing a SKU from a part (Normal Flow)
    Given the part has a valid SKU
     When the request to remove a SKU is made
     Then the part's SKU is deleted
  
  Scenario: Removing an unexisting SKU from a part (Error Flow)
    Given the part does not have a valid SKU
     When the request to remove a SKU is made
     Then the system should not treat the request 
      And an error message should display "Error, part does not possess a SKU"
  
  
