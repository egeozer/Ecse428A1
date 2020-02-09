  Feature: Query user attributes
  
  As a System Admin of the Lego(R) Part Warehouse
  I would like to query the attributes of a user
  So that I can view the information of a user registered in the system
  
  Scenario: Query an attribute of an existing user (Normal Flow)
    Given the following users are registered in the system:
      | Name    | Surname | Password   | email              | Phone Number | Address              | City     | Province | Countrty | Privilege    | 
      | Pierre  | Robert  | bla3Bla;   | pierre@outlook.ca  | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | Consumer     | 
      | Paul    | May     | 3342adfa23 | paul@outlook.ca    | 5143334438   | 3002 St-Laurent blvd | Montreal | QC       | Canada   | Consumer     | 
      | Charbel | Ronald  | sdfAS23fg  | Charbel@outlook.ca | 5143324411   | 3133 St-Laurent blvd | Montreal | QC       | Canada   | System Admin | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I query the "email" attribute of user "Paul"
     Then the system should return the following information
      | email           | 
      | paul@outlook.ca | 
  
  Scenario: Query an attribute of an non existing user (Error Flow)
    Given the following users are registered in the system:
      | Name    | Surname | Password   | email              | Phone Number | Address              | City     | Province | Countrty | Privilege    | 
      | Pierre  | Robert  | bla3Bla;   | pierre@outlook.ca  | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | Consumer     | 
      | Paul    | May     | 3342adfa23 | paul@outlook.ca    | 5143334438   | 3002 St-Laurent blvd | Montreal | QC       | Canada   | Consumer     | 
      | Charbel | Ronald  | sdfAS23fg  | Charbel@outlook.ca | 5143324411   | 3133 St-Laurent blvd | Montreal | QC       | Canada   | System Admin | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I query the "email" attribute of user "Alice"
     Then the system should not return information
      And the system should display an error message notifying me that the user "Alice" does not exist
  
  Scenario: Query an invald attribute of an existing user (Error Flow)
    Given the following users are registered in the system:
      | Name    | Surname | Password   | email              | Phone Number | Address              | City     | Province | Countrty | Privilege    | 
      | Pierre  | Robert  | bla3Bla;   | pierre@outlook.ca  | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | Consumer     | 
      | Paul    | May     | 3342adfa23 | paul@outlook.ca    | 5143334438   | 3002 St-Laurent blvd | Montreal | QC       | Canada   | Consumer     | 
      | Charbel | Ronald  | sdfAS23fg  | Charbel@outlook.ca | 5143324411   | 3133 St-Laurent blvd | Montreal | QC       | Canada   | System Admin | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I query the "age" attribute of user "Paul"
     Then the system should not return information
      And the system should display an error message notifying me that the attribute "age" is not valid
  
  