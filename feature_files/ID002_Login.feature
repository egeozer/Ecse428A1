Feature: Login 
  
As a Consumer of the Lego(R) Part Warehouse System
I would like to Login to the System
So that I Access my Lego(R) Parts Warehouse System Account
  
Scenario: Login to the System with Valid Information (Normal Flow)

Given I am browsing the login page
When I login with this authentication information:
| Email             | Password |
| pierre@outlook.ca | bla3Bla; |
Then I should get logged in to the system
And the system should display my account dashboard
  
Scenario: Login to the System with Invalid Email (Error Flow)

Given I am browsing the login page
When I login with this authentication information:
| Email               | Password |
| pierre23@outlook.ca | bla3Bla; |
Then I should not get logged in to the system
And the system should display an error message notifying me that the email or password is invalid

Scenario: Login to the System with Invalid Password (Error Flow)

Given I am browsing the login page
When I login with this authentication information:
| Email             | Password |
| pierre@outlook.ca | bla4Bla! |
Then I should not get logged in to the system
And the system should display an error message notifying me that the email or password is invalid
