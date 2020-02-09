Feature: Create Pick List 
  
As an Operator of the Lego(R) Part Warehouse
I would like to create a pick list from a customer order
So that a warehouse picker will be able to fulfill the specific order for the customer
  
Scenario: Pick Several Valid Products (Normal Flow)

Given user OP3 is logged on as the operator
And the inventory has been initialized
When the following products are requested
|Quantity   |Part      |
|25         |655c      |
|40         |3001      |
|150        |645a      |
Then the following pick list is returned
|Bin       |Quantity   |Part      |
|bin1899   |25         |655c      |
|bin2012   |40         |3001      |
|bin1755   |150        |645a      |

Scenario: Pick One Valid Product (Alternate Flow)

Given user OP3 is logged on as the operator
And the inventory has been initialized
When the quantity 25 of Part 655c is requested
Then the following pick list is returned
|Bin       |Quantity   |Part      |
|bin1899   |25         |655c      |

Scenario: Pick Several Valid Products Including Duplicates (Alternate Flow)

Given user OP3 is logged on as the operator
And the inventory has been initialized
When the following products are requested
|Quantity   |Part      |
|25         |655c      |
|40         |3001      |
|105        |655c      |
|150        |645a      |
Then the following pick list is returned
|Bin       |Quantity   |Part      |
|bin1899   |130        |655c      |
|bin2012   |40         |3001      |
|bin1755   |150        |645a      |

Scenario: Pick Several Valid Products from Multiple Bins (Alternate Flow)

Given user OP3 is logged on as the operator
And the inventory count is defined to be
|Bin       |Quantity   |Part      |
|bin1899   |300        |655c      |
|bin2012   |20         |3001      |
|bin2013   |40         |3001      |
|bin1755   |350        |645a      |
When the following products are requested
|Quantity   |Part      |
|25         |655c      |
|50         |3001      |
|150        |645a      |
Then the following pick list is returned
|Bin       |Quantity   |Part      |
|bin1899   |130        |655c      |
|bin2012   |20         |3001      |
|bin2013   |30         |3001      |
|bin1755   |150        |645a      |

Scenario: Pick Several Valid Products including 1 Invalid Product (Error Flow)

Given user OP3 is logged on as the operator
And the inventory has been initialized
When the following products are requested
|Quantity   |Part      |
|25         |655c      |
|40         |3001      |
|150        |blue brick|
Then the following pick list is returned
|Bin       |Quantity   |Part      |
|bin1899   |25         |655c      |
|bin2012   |40         |3001      |
|Part DNE  |150        |blue brick|
  
Scenario: Pick Several Valid Products including 2 Invalid Products (Error Flow)

Given user OP3 is logged on as the operator
And the inventory has been initialized
When the following products are requested
|Quantity   |Part      |
|25         |655c      |
|40         |big wheel |
|150        |blue brick|
Then the following pick list is returned
|Bin       |Quantity   |Part      |
|bin1899   |25         |655c      |
|Part DNE  |40         |big wheel |
|Part DNE  |150        |blue brick|
 
Scenario: Pick Several Valid Products including all Invalid Products (Error Flow)

Given user OP3 is logged on as the operator
And the inventory has been initialized
When the following products are requested
|Quantity   |Part      |
|25         |shiny pin |
|40         |big wheel |
|150        |blue brick|
Then the following pick list is returned
|Bin       |Quantity   |Part      |
|Part DNE  |25         |shiny pin |
|Part DNE  |40         |big wheel |
|Part DNE  |150        |blue brick|
  
Scenario: Invalid Operator Attempts to Pick One Valid Product (Error Flow)

Given user Undefined is logged on as the operator
And the inventory has been initialized
When the quantity 25 of Part 655c is requested
Then the system displays an error message notifying that a valid Operator must be logged in

Scenario: Suspended Operator Attempts to Pick One Valid Product (Error Flow)

Given user Suspended is logged on as the operator
And the inventory has been initialized
When the quantity 25 of Part 655c is requested
Then the system displays an error message notifying that an Operator who isn't suspended must be logged in

Scenario: Pick One Valid Product with Inventory not Initialized (Error Flow)

Given user Undefined is logged on as the operator
And the inventory has not been initialized
When the quantity 25 of Part 655c is requested
Then the system displays an error message notifying that must be initialized before pick list can be created

Scenario: Pick Several Valid Products with Insufficient Quantity from a Single Bin for a Single Product (Error Flow)

Given user OP3 is logged on as the operator
And the inventory count is defined to be
|Bin       |Quantity   |Part      |
|bin1899   |300        |655c      |
|bin2012   |20         |3001      |
|bin1755   |350        |645a      |
When the following products are requested
|Quantity   |Part      |
|25         |655c      |
|40         |3001      |
|150        |645a      |
Then the following pick list is returned
|Bin       |Quantity   |Part      |
|bin1899   |130        |655c      |
|bin2012   |20         |3001      |
|SHORTFALL |20         |3001      |
|bin1755   |150        |645a      |

Scenario: Pick One Valid Product with Insufficient Quantity from Multiple Bins (Error Flow)

Given user OP3 is logged on as the operator
And the inventory count is defined to be
|Bin       |Quantity   |Part      |
|bin1899   |100        |655c      |
|bin1898   |120        |655c      |
When the quantity 250 of Part 655c is requested
Then the following pick list is returned
|Bin       |Quantity   |Part      |
|bin1899   |100        |655c      |
|bin1898   |120        |655c      |
|SHORTFALL |30         |655c      |
