  Feature: Suspend a user
  
  As a System Admin of the Lego(R) Part Warehouse
  I would like to suspend a user
  So that I can temporarely prevent the user from logging in the Lego(R) Part Warehouse System
  
  Scenario: Suspend an existing user using his name (Normal Flow)
    Given the following user is already regsitered
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | 
      And user with name "Pierre" is unique 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I suspend user with name "Pierre"
     Then the system should set the user status to "Suspended"
  
  Scenario: Suspend an existing user using his non unique name (Alternate Flow)
    Given the following user is already regsitered
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | 
      And user with name "Pierre" is not unique
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I suspend user with name "Pierre"
     Then I should be prompted to suspend using an email address
  
  Scenario: Suspend an existing user using his email address (Alternate Flow)
    Given the following user is already regsitered
      | Name   | Surname | Password | email             | Phone Number | Address              | City     | Province | Countrty | 
      | Pierre | Robert  | bla3Bla; | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I suspend user with email "pierre@outlook.ca"
     Then the system should set the user status to "Suspended"
  
  Scenario: Suspend an non existing user using his name (Error Flow)
    Given the following user is already regsitered
      | Name | Surname | Password | email           | Phone Number | Address              | City     | Province | Countrty | 
      | Paul | Robert  | bla3Bla; | paul@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I suspend user with name "Pierre"
     Then the system should display an error message notifying me that the user with name "Pierre" does not exist
  
  Scenario: Suspend an non existing user using his email (Error Flow)
    Given the following user is already regsitered
      | Name | Surname | Password | email           | Phone Number | Address              | City     | Province | Countrty | 
      | Paul | Robert  | bla3Bla; | paul@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   | 
      And I am logged in as user Charbel
      And I have System Admin privileges
     When I suspend user with email "pierre@outlook.ca"
     Then the system should display an error message notifying me that the user with email "pierre@outlook.ca" does not exist
  
  