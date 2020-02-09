Feature: Cancel Order 
  
As a consumer of the Lego(R) Part Warehouse
I would like to Cancel an Existing Order
So that I do not Receive the Lego(R) parts if I Change my Mind
  
Scenario: Cancel Order (Normal Flow)

Given I am logged on as user Pierre
And my payment information is valid
And my existing order has not been shipped yet
When I request to cancel my order
Then the system should cancel my order
And I should receive a confirmation receipt by email
  
Scenario: Cancel Order with Invalid Payment Information (Error Flow)

Given I am logged on as user Pierre
And my payment information is invalid
And my existing order has not been shipped yet
When I request to cancel my order
Then the system should not cancel my order
And I should receive an error message prompting me to update my payment information so that that I can be refunded
  
Scenario: Cancel Order when it has Already been Shipped (Error Flow)

Given I am logged on as user Pierre
And my payment information is valid
And my existing order has already been shipped
When I request to cancel my order
Then the system should not cancel my order
And I should receive an error message informing me that I cannot cancel my order anymore since it has been shipped
