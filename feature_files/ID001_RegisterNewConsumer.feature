Feature: Register New Consumer 
  
As an upcoming consumer of the Lego(R) Part Warehouse
I would like to register to the system 
So that I can place orders to receive the Lego(R) parts that I want
  
Scenario: Register to the System with Valid Information (Normal Flow)

Given I am browsing the register page
When I register with this profile information:
| Name   | Surname | Password | Password confirmation | email             | Phone Number | Address              | City     | Province | Countrty |
| Pierre | Robert  | bla3Bla; | bla3Bla;              | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   |
Then the system should create my consumer account
And I should receive a confirmation email
And I should now be able to sign in to the system
  
Scenario: Register to the System with an Email tied to an Existing Account (Alternate Flow)

Given I am browsing the register page
When I register with this profile information:
| Name   | Surname | Password | Password confirmation | email             | Phone Number | Address              | City     | Province | Countrty |
| Pierre | Robert  | bla3Bla; | bla3Bla;              | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   |
Then the system should not create my consumer account
And I should be prompted to access my existing account

Scenario: Register to the System with an Invalid Password Format (Error Flow)

Given I am browsing the register page
When I register with this profile information:
| Name   | Surname | Password | Password confirmation | email             | Phone Number | Address              | City     | Province | Countrty |
| Pierre | Robert  | bla      | bla                   | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   |
Then the system should not create my consumer account
And the system should display an error message notifying me about the password format requirements
  
Scenario: Register to the System with an Mismatched Password and Password Confirmation (Error Flow)
  
Given I am browsing the register page
When I register with this profile information:
| Name   | Surname | Password | Password confirmation | email             | Phone Number | Address              | City     | Province | Countrty |
| Pierre | Robert  | blaBla3; | blaBla4!              | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   |
Then the system should not create my consumer account
And the system should display an error message notifying me about the password confirmation mismatch
 
Scenario: Register to the System with an Invalid Email (Error Flow)
  
Given I am browsing the register page
When I register with this profile information:
| Name   | Surname | Password | Password confirmation | email             | Phone Number | Address              | City     | Province | Countrty |
| Pierre | Robert  | blaBla3; | blaBla3;              | pierremail.com    | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   |
Then the system should not create my consumer account
And the system should display an error message notifying me about the invalid email
  
Scenario: Register to the System with an Invalid Phone Number (Error Flow)
  
Given I am browsing the register page
When I register with this profile information:
| Name   | Surname | Password | Password confirmation | email             | Phone Number | Address              | City     | Province | Countrty |
| Pierre | Robert  | blaBla3; | blaBla3;              | pierre@outlook.ca | 06           | 3092 St-Laurent blvd | Montreal | QC       | Canada   |
Then the system should not create my consumer account
And the system should display an error message notifying me about the invalid phone number

Scenario: Register to the System with an Invalid Address (Error Flow)
  
Given I am browsing the register page
When I register with this profile information:
| Name   | Surname | Password | Password confirmation | email             | Phone Number | Address              | City     | Province | Countrty |
| Pierre | Robert  | blaBla3; | blaBla3;              | pierre@outlook.ca | 5143334444   | My house             | Montreal | QC       | Canada   |
Then the system should not create my consumer account
And the system should display an error message notifying me about the invalid address
