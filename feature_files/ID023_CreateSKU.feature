  Feature: Create SKU for a part
  
  As a Inventory Manager of the Lego(R) Part Warehouse
  I would like to create a SKU for a part
  So that I can have a unique ID for the part
  
  Background: 
    Given I am logged in as an inventory manager
  
  Scenario: Creating a valid SKU for a part (Normal Flow)
     When the request to create a SKU is made
     Then the system generates a unique SKU
      And the SKU is assigned to the part
  
  Scenario: Creating a duplicate SKU for a part (Error Flow)
    Given a SKU already exists for the part
     When the request to create a SKU is made
     Then the system should not treat the request 
      And an error message should display "Error, part already possess a SKU"
  
