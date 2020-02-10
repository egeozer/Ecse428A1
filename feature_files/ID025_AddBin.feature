  Feature: Add Bin
  
  As a Inventory Manager of the Lego(R) Part Warehouse
  I would like to add a bin
  So that I can associate a part type to the bin and store parts in it
  
  Background: 
    Given I am logged in as an inventory manager
  
  Scenario: Adding a bin to the database (Normal Flow)
     When the request to add a bin is made
     Then the system creates a bin
      And the bin is assigned a part type
      And the bin is assigned a size
  
  Scenario: Adding a duplicate bin to the database (Alternate Flow)
    Given a bin with type "645" and size "20" exists in the database
      And the new bin type is "645" and size "20"
     When the request to add a bin is made
     Then the system creates a bin
      And the bin is assigned type "645"
      And the bin is assigned size "20"
  
  Scenario: Adding an illegal bin (Error Flow)
    Given a new bin with size "10000"
     When the request to add a bin is made
     Then the system should not treat the request 
      And an error message should display "Error, size of the bin is too large"
  
  
