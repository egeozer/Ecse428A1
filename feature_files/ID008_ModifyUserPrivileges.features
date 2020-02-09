  Feature: Modify user privileges
  
  As a System Admin of the Lego(R) Part Warehouse
  I would like to modify a user privilges
  So that I can allow specific users to perform privilged system operations
  
  Scenario: Modify an existing user privileges using his email (Normal Flow)
  
    Given the following user is already regsitered
      | Name   | Surname | Password | Password confirmation | email             | Phone Number | Address              | City     | Province | Countrty | Privilege | 
      | Pierre | Robert  | bla3Bla; | bla3Bla;              | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | Consumer  | 
      And I am logged in as user Charbel
      And I have System Admin privileges
      And I change the privileges of user with email "pierre@outlook.ca" to "Server Admin"
     Then the system should set the user privilege to "Server Admin" 
  
  Scenario: Downgrading an existing System Admin user privileges using his email (Alternate Flow)
  
    Given the following user is already regsitered
      | Name   | Surname | Password | Password confirmation | email             | Phone Number | Address              | City     | Province | Countrty | Privilege    | 
      | Pierre | Robert  | bla3Bla; | bla3Bla;              | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | System Admin | 
      And I am logged in as user Charbel
      And I have System Admin privileges
      And I change the privileges of user with email "pierre@outlook.ca" to "Consumer"
     Then the system will not change the privileges of the user
      And the system should display an error message notifying me that privileges can not be downgraded
  
  Scenario: Modify a non existing user privileges using his email (Normal Flow)
  
    Given the following user is already regsitered
      | Name | Surname | Password | Password confirmation | email           | Phone Number | Address              | City     | Province | Countrty | Privilege | 
      | Paul | Robert  | bla3Bla; | bla3Bla;              | paul@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | Consumer  | 
      And I am logged in as user Charbel
      And I have System Admin privileges
      And I change the privileges of user with email "pierre@outlook.ca" to "Server Admin"
     Then the system should display an error message notifying me that the user with email "pierre@outlook.ca" does not exist
  
  