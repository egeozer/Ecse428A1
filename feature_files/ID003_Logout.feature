Feature: Logout
  
As a consumer of the Lego(R) Part Warehouse
I would like to Logout of the System
So that I can keep my Account and Information Safe
  
Scenario: Logout (Normal Flow)

Given I am logged on as user Pierre
When I request to be logged out of the system
Then the system should log me out
And I should no longer be able to access my account
  
Scenario: Logout without Being Logged on (Alternate Flow)

Given I am not logged on to the system
When I request to be logged out of the system
Then the system should display a message to inform me that I am already logged out
