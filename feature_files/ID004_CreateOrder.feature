Feature: Create Order 
  
As a consumer of the Lego(R) Part Warehouse
I would like to create a new order
So that I can receive the Lego(R) parts that I want
  
Scenario: Create Order with Several Valid Products and Quantities (Normal Flow)

Given I am logged on as user Pierre
And my payment information is valid
When I submit an order with the following products and quantities:
|Quantity   |Part      |
|25         |655c      |
|40         |3001      |
|150        |645a      |
Then the system should create my order
And I should receive a confirmation receipt by email
  
Scenario: Create Order with One Valid Products and Quantity (Alternate Flow)

Given I am logged on as user Pierre
And my payment information is valid
When I submit an order with the quantity 30 of Part bb19
Then the system should create my order
And I should receive a confirmation receipt by email

Scenario: Create Order with Several Valid Products and Quantities Including Duplicates (Alternate Flow)

Given I am logged on as user Pierre
And my payment information is valid
When I submit an order with the following products and quantities:
|Quantity   |Part      |
|25         |655c      |
|40         |655c      |
|150        |645a      |
Then the system should create my order
And I should receive a confirmation receipt by email
  
Scenario: Create Order with Several Valid Products and 1 Invalid Quantity (Error Flow)

Given I am logged on as user Pierre
And my payment information is valid
When I submit an order with the following products and quantities:
|Quantity   |Part      |
|25         |655c      |
|-10        |3001      |
|150        |645a      |
Then the system should not create my order
And I should receive an error message notifying me of the invalid quantity
 
Scenario: Create Order with Several Products Including 1 Invalid Product and Quantities (Error Flow)

Given I am logged on as user Pierre
And my payment information is valid
When I submit an order with the following products and quantities:
|Quantity   |Part      |
|25         |655c      |
|40         |big lego  |
|150        |645a      |
Then the system should not create my order
And I should receive an error message notifying me of the invalid product
  
Scenario: Create Order with Several Valid Products and Quantities and Invalid Payment Information (Error Flow)

Given I am logged on as user Pierre
And my payment information is invalid
When I submit an order with the following products and quantities:
|Quantity   |Part      |
|25         |655c      |
|40         |3001      |
|150        |645a      |
Then the system should not create my order
And I should receive an error message prompting me to update my payment information so that I can be charged
