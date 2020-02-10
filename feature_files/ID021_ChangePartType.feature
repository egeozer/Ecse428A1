  Feature: Change part type
  
  As a Inventory Manager of the Lego(R) Part Warehouse
  I would like to change a part type
  So that I can keep parts up to date on their type
  
  Background: 
    Given I am logged in as an inventory manager
  
  Scenario: Changing a part's type to a new valid one (Normal Flow)
    Given the new part type does not contain any illegal charcacters 
      And And the new part type is under 10 characters in length
     When the request to change the part type is made
     Then the previous part type is erased
      And the new type is given to the part
  
  Scenario: Changing a part's type to an invalid one (Error Flow)
    Given the new part type contains an illegal character "%"
      And the new part type is under 10 characters in lenght
     When the request to change the part type is made
     Then the system should not treat the request
      And an error message should display "Invalid character, please inser numbers and letters only"
  
  Scenario: Changing to the same part type (Error Flow)
    Given the part has type "645"
      And the new type is "645"
     Then when the request to change the part type is made
     Then the system should not treat the request
      And an error message should display "Error, Attempting to change to the same part type"
  
