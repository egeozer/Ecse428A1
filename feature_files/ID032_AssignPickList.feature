  Feature: Assign Pick List 
  
  As an Operator of the Lego(R) Part Warehouse
  I would like to assign a pick list to a warehouse picker
  So that the specific warehouse picker will be able to fulfill the specific order for the customer
  
  Scenario: Assign Pick List (Normal Flow)
  
    Given user OP3 is logged on as the operator
      And user WP2 is an existing Warehouse Picker
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is assigned to WP2
     Then the system assigns the pick list with id 001 to Warehouse picker WP2
  
  Scenario: Invalid Operator Attempts to Assign Pick List (Error Flow)
  
    Given user Undefined is logged on as the operator
      And user WP2 is an existing Warehouse Picker
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is assigned to WP2
     Then the system does not assign the pick list
      And the system displays an error message notifying that a Valid Operator must be logged in
  
  Scenario: Suspended Operator Attempts to Assign Pick List (Error Flow)
  
    Given user Suspended is logged on as the operator
      And user WP2 is an existing Warehouse Picker
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is assigned to WP2
     Then the system does not assign the pick list
      And the system displays an error message notifying that an Operator who isn't suspended must be logged in
  
  Scenario: Assign Pick List to Invalid Warehouse Picker (Error Flow)
  
    Given user OP3 is logged on as the operator
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is assigned to Undefined
     Then the system does not assign the pick list
      And the system displays an error message notifying that a Valid Warehouse Picker must be selected
      
  Scenario: Assign Pick List to Suspended Warehouse Picker (Error Flow)
  
    Given user OP3 is logged on as the operator
      And user Suspended is a suspended Warehouse Picker
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is assigned to Suspended
     Then the system does not assign the pick list
      And the system displays an error message notifying that a Warehouse Picker who isn't suspended must selected
      
  Scenario: Assign Invalid Pick List (Error Flow)
  
    Given user OP3 is logged on as the operator
      And user WP2 is a suspended Warehouse Picker
     When the pick list with id Undefined is assigned to WP2
     Then the system does not assign the pick list
      And the system displays an error message notifying that a Valid Pick List must be selected
  
  Scenario: Assign Pick List that has already been prepared (Error Flow)
  
    Given user OP3 is logged on as the operator
      And user WP2 is a suspended Warehouse Picker
      And the existing pick list with id 001 has already been prepared
     When the pick list with id 001 is assigned to WP2
     Then the system does not assign the pick list
      And the system displays an error message notifying that the Pick List with id 001 has already been prepared
