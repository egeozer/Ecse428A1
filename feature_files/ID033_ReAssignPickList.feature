  Feature: ReAssign Pick List 
  
  As an Operator of the Lego(R) Part Warehouse
  I would like to reassign a pick list to another warehouse picker
  So that the specific warehouse picker will be able to fulfill the specific order for the customer
  
  Scenario: ReAssign Pick List (Normal Flow)
  
    Given user OP3 is logged on as the operator
      And user WP2 is an existing Warehouse Picker
      And the existing pick list with id 001 is assigned to Warehouse Picker WP1
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is reassigned to WP2
     Then the system assigns the pick list with id 001 to Warehouse picker WP2
      And the system remove the pick list with id 001 from Warehouse picker WP1's assignments
  
  Scenario: Invalid Operator Attempts to ReAssign Pick List (Error Flow)
  
    Given user Undefined is logged on as the operator
      And user WP2 is an existing Warehouse Picker
      And the existing pick list with id 001 is assigned to Warehouse Picker WP1
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is reassigned to WP2
     Then the system does not reassign the pick list
      And the system displays an error message notifying that a Valid Operator must be logged in
  
  Scenario: Suspended Operator Attempts to ReAssign Pick List (Error Flow)
  
    Given user Suspended is logged on as the operator
      And user WP2 is an existing Warehouse Picker
      And the existing pick list with id 001 is assigned to Warehouse Picker WP1
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is reassigned to WP2
     Then the system does not reassign the pick list
      And the system displays an error message notifying that an Operator who isn't suspended must be logged in
  
  Scenario: ReAssign Pick List to Invalid Warehouse Picker (Error Flow)
  
    Given user OP3 is logged on as the operator
      And the existing pick list with id 001 is assigned to Warehouse Picker WP1
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is reassigned to Unefined
     Then the system does not reassign the pick list
      And the system displays an error message notifying that a Valid Warehouse Picker must be selected
  
  Scenario: ReAssign Pick List to Suspended Warehouse Picker (Error Flow)
  
    Given user OP3 is logged on as the operator
      And user Suspended is a suspended Warehouse Picker
      And the existing pick list with id 001 is assigned to Warehouse Picker WP1
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is reassigned to Suspended
     Then the system does not reassign the pick list
      And the system displays an error message notifying that a Warehouse Picker who isn't suspended must selected
  
  Scenario: Assign Pick List that has already been prepared (Error Flow)
  
    Given user OP3 is logged on as the operator
      And user WP2 is an existing Warehouse Picker
      And the existing pick list with id 001 is assigned to Warehouse Picker WP1
      And the existing pick list with id 001 has already been prepared
     When the pick list with id 001 is reassigned to WP2
     Then the system does not reassign the pick list
      And the system displays an error message notifying that the Pick List with id 001 has already been prepared
  
  
