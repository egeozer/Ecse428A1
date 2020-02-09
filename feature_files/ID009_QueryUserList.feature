  Feature: Query user list
  
  As a System Admin of the Lego(R) Part Warehouse
  I would like to query the user list
  So that I can have an overview of the users registered in the system
  
  Scenario: Query the user list with existing users (Normal Flow)
    Given the following users are registered in the system:
      | Name    | Surname | Password   | email              | Phone Number | Address              | City     | Province | Countrty | Privilege    | 
      | Pierre  | Robert  | bla3Bla;   | pierre@outlook.ca  | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | Consumer     | 
      | Paul    | May     | 3342adfa23 | paul@outlook.ca    | 5143334438   | 3002 St-Laurent blvd | Montreal | QC       | Canada   | Consumer     | 
      | Charbel | Ronald  | sdfAS23fg  | Charbel@outlook.ca | 5143324411   | 3133 St-Laurent blvd | Montreal | QC       | Canada   | System Admin | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I query the user list
     Then the system should return the following information
      | Name    | Surname | Privilege    | 
      | Pierre  | Robert  | Consumer     | 
      | Paul    | May     | Consumer     | 
      | Charbel | Ronald  | System Admin | 
  
  # since you need to have a system admin account to peform the query user list operation there will always be at least that account registered in the
  # system therefore the normal flow will always occur since the system admin account is guaranteed to be in the list