  Feature: Delete Pick List 
  
  As an Operator of the Lego(R) Part Warehouse
  I would like to delete a pick list from a customer order
  So that a warehouse picker will not fulfill the canceled specific order for the customer
  
  Scenario: Delete Pick List (Normal Flow)
  
    Given user OP3 is logged on as the operator
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is requested to be deleted
     Then the system deletes the pick list
  
  Scenario: Invalid Operator Attempts to Delete Pick List (Error Flow)
  
    Given user Undefined is logged on as the operator
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is requested to be deleted
     Then the system does not delete the pick list
      And the system displays an error message notifying that a valid Operator must be logged in
  
  Scenario: Suspended Operator Attempts to Delete Pick List (Error Flow)
  
    Given user Suspended is logged on as the operator
      And the existing pick list with id 001 has not been prepared yet
     When the pick list with id 001 is requested to be deleted
     Then the system does not delete the pick list
      And the system displays an error message notifying that an Operator who isn't suspended must be logged in
  
  Scenario: Delete Invalid Pick List (Error Flow)
  
    Given user OP3 is logged on as the operator
     When the pick list with id Undefined is requested to be deleted
     Then the system does not delete the pick list
      And the system displays an error message notifying that a Valid Pick List must be selected
  
  Scenario: Delete Pick List that has already been prepared (Error Flow)
  
    Given user OP3 is logged on as the operator
      And the existing pick list with id 001 has alredy been prepared
     When the pick list with id 001 is requested to be deleted
     Then the system does not delete the pick list
      And the system displays an error message notifying that the Pick List with id 001 has already been prepared
  
