  Feature: Add part type
  
  As a Inventory Manager of the Lego(R) Part Warehouse
  I would like to add a new part type
  So that I can differentiate parts by their type
  
  Background: 
    Given I am logged in as an inventory manager
  
  Scenario: Adding a valid part type (Normal Flow)
    Given the part type does not contain illegal characters
      And the part type is under 10 characters in length
     When the request to add a type is made
     Then the type is added to the part
  
  Scenario: Adding an illegal part type (Error Flow)
    Given the part type contains an illegal character "%"
      And the part type is under 10 characters in length
     When the request to add a type is made
     Then the system should not treat the request
      And an error message should display "Invalid character, please insert numbers and letters only"
  
  Scenario: Adding an invalid length part type (Error Flow)
    Given the part type does not contain illegal characters
      And the part type is over 10 characters long
     When the request to add a type is made
     Then the system should not treat the request
      And an error message should display "Invalid length, please submit a shorter type (<10 characters)"
  
  Scenario: Adding a duplicate part type (Error Flow)
    Given the part already has a type
      And the new type does not contain any illegal characters
      And the new type is under 10 characters in length
     When When the request to add a type is made
     Then the system should not treat the request
      And an error message should display "Error, part already possesses a type"
