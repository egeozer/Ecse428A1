  Feature: Modify user attributes
  
  As a System Admin of the Lego(R) Part Warehouse
  I would like to modify the attributes of a user
  So that I can adjust incorrect attributes given by a user
  
  Scenario: Modify the attributes of an existing user (Normal Flow)
    Given the following users are registered in the system:
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I modify the attribute "Phone Number" of user "Pierre" to "+15143334444"
     Then the system should return the following information
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | +15143334444 | 3092 St-Laurent blvd | Montreal | QC       | Canada   | 
  
  Scenario: Modify the attributes of an existing user with invalid input (Error Flow)
    Given the following users are registered in the system:
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I modify the attribute "Phone Number" of user "Pierre" to "abcd334444"
     Then the system should not modify any attribute
      And the system should display an error message notifying me that the format given does not match that of the attribute
  
  Scenario: Modify the attributes of an non existing user(Error Flow)
    Given the following users are registered in the system:
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I modify the attribute "Address" of user "Jake" to "2033 St-Laurent blvd"
     Then the system should not modify any attribute
      And the system should display an error message notifying me that the user "Jake" does not exist
  
  