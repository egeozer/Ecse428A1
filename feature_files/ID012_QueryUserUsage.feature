  Feature: Query user system usage
  
  As a System Admin of the Lego(R) Part Warehouse
  I would like to query the system usage of a user
  So that I can monitor the activity of a user in the the system
  
  Scenario: Query system usage of an existing user (Normal Flow)
    Given the following users are registered in the system:
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I query the system usage of user "Pierre"
     Then the system should return the system usage logs of user "Pierre"
  
  Scenario: Query system usage of a non existing user (Error Flow)
    Given the following users are registered in the system:
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I query the system usage of user "Jake"
     When I query the status of user "Jake"
     Then the system should not return information
      And the system should display an error message notifying me that the user "Jake" does not exist
  
  