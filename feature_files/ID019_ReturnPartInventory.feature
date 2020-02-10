  Feature: Return a part to inventory
  
  As a Inventory Manager of the Lego(R) Part Warehouse
  I would like to return a part to the inventory
  So that I can document the addition of a new part to the inventory
  
  Background: 
    Given I am logged in as an inventory manager
  
  Scenario: Return a valid part to the inventory (Normal flow)
    Given the returning part has a valid type
      And the inventory is not full
     When the request to return the part to the inventory is made
     Then the part is added to the list
  
  Scenario: Return a part with an invalid type (Error Flow)
    Given the returning part has type "1000000000" 
     When the request to return the part to the inventory is made
     Then the system should not treat the request
      And an error message should display "Invalid request, please check your input"
  
  Scenario: Return a part with a full inventory (Error Flow)
    Given the returning part has a valid type
      And the inventory is full
     When the request to return the part to the inventory is made
     Then the system should not treat the request
      And an error message should display "Inventory full, please free up space"
  
  Scenario: Returning part already exists in inventory (Error Flow)
    Given the inventory contains a part with the returning part's SKU
     When the request to return the part is made
     Then the system should not treat the request
      And an error message should display "Error, part already in inventory"
  
  
