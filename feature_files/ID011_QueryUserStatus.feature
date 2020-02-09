  Feature: Query user status
  
  As a System Admin of the Lego(R) Part Warehouse
  I would like to query the status of a user
  So that I can view if a user has the permission to log in the system
  
  Scenario: Query status of an existing user (Normal Flow)
    Given the following users are registered in the system:
      | Name    | Surname | Password   | email              | Phone Number | Address              | City     | Province | Countrty | Status     | 
      | Pierre  | Robert  | bla3Bla;   | pierre@outlook.ca  | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | Deprecated | 
      | Paul    | May     | 3342adfa23 | paul@outlook.ca    | 5143334438   | 3002 St-Laurent blvd | Montreal | QC       | Canada   | Suspended  | 
      | Charbel | Ronald  | sdfAS23fg  | Charbel@outlook.ca | 5143324411   | 3133 St-Laurent blvd | Montreal | QC       | Canada   | Ok         | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I query the status of user "Paul"
     Then the system should return the following information
      | Status    | 
      | Suspended | 
  
  Scenario: Query status of a non existing user (Error Flow)
    Given the following users are registered in the system:
      | Name    | Surname | Password   | email              | Phone Number | Address              | City     | Province | Countrty | Status     | 
      | Pierre  | Robert  | bla3Bla;   | pierre@outlook.ca  | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | Deprecated | 
      | Paul    | May     | 3342adfa23 | paul@outlook.ca    | 5143334438   | 3002 St-Laurent blvd | Montreal | QC       | Canada   | Suspended  | 
      | Charbel | Ronald  | sdfAS23fg  | Charbel@outlook.ca | 5143324411   | 3133 St-Laurent blvd | Montreal | QC       | Canada   | Ok         | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I query the status of user "Jake"
     Then the system should not return information
      And the system should display an error message notifying me that the user "Jake" does not exist
  