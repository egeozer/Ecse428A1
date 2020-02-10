  Feature: Query the part list
  
  As a Inventory Manager of the Lego(R) Part Warehouse System
  I would like to query the list of parts
  So that I can view a list of all parts in the inventory
  
	Background: 
		Given I am logged in as an inventory manager
  
	Scenario: Launch a valid query to the list of parts (Normal Flow)
		When the query request is made
		Then the parts appear in an ordered list

	Scenario: Launch a query to an empty list of parts (Alternate Flow)
		When there are no existing parts in the inventory
		And the query request is made
		Then an empty list is returned as a result
        
	Scenario: Launch a query with an invalid character (Error Flow)
		Given the query contains the character "&"
		And "&" is an invalid character
		When the request is made
		Then the system should not treat the request
		And an error message should display "Error, invalid character in request"
