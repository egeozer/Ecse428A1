Feature: Create Order 
  
As a consumer of the Lego(R) Part Warehouse
I would like to create a new order
So that I can receive the Lego(R) parts that I want.
  
Scenario: Create Order with Several Valid Products and Quantities (Normal Flow)

Given I am logged on as user Pierre
And my payment information is valid
When I submit an order with the following products and quantities:
|Quantity   |Part      |
|25         |655c      |
|40         |3001      |
|150        |645a      |
Then the system should create my oder
And I should receive a confirmation receipt by email
  
Scenario: Create Order with One Valid Products and Quantity (Alternate Flow)

Given I am logged on as user Pierre
And my payment information is valid
When I submit an order with the quantity 30 of Part bb19
Then the system should create my oder
And I should receive a confirmation receipt by email

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
