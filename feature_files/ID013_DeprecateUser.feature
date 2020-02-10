  Feature: Deprecate user
  
  As a System Admin of the Lego(R) Part Warehouse
  I would like to deprecate user
  So that I can indefinitely prevent the credentials from being used again to log in the System
  
  Scenario: Deprecate an existing user (Normal Flow)
    Given the following users are registered in the system:
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | Status | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | Ok     | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I deprecate the user "Pierre"
     Then the system should set the user status to "Deprecated"
  
  Scenario: Deprecate of an already deprecated existing user (Error Flow)
    Given the following users are registered in the system:
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | Status     | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | Deprecated | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I deprecate the user "Pierre"
     Then the system should display an error message notifying me that the user "Pierre" is already deperecated
  
  Scenario: Deprecate a non existing user (Error Flow)
    Given the following users are registered in the system:
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | Status | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | Ok     | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I deprecate the user "Jake"
     Then the system should display an error message notifying me that the user "Jake" does not exist
  