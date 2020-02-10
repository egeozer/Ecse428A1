  Feature: Create Pick List 
  
  As an Operator of the Lego(R) Part Warehouse
  I would like to modify a pick list from a customer order
  So that a warehouse picker will be able to fulfill the updated specific order for the customer
  
  Scenario: Modify Pick List for Several Valid Products (Normal Flow)
  
    Given user OP3 is logged on as the operator
      And the inventory has been initialized
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 25       | 655c |
      | bin2012 | 40       | 3001 |
      | bin1755 | 150      | 645a |
     When modifications for the following products are requested
      | Quantity | Part | Update Operation | 
      | 15       | 655c | Remove           |
      | 40       | 3001 | Add              |
     Then the following updated pick list is returned
      | Bin     | Quantity | Part | 
      | bin1899 | 10       | 655c | 
      | bin2012 | 80       | 3001 | 
      | bin1755 | 150      | 645a | 
  
  Scenario: Modify Pick List for One Valid Product (Alternate Flow)
  
    Given user OP3 is logged on as the operator
      And the inventory has been initialized
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 25       | 655c |
      | bin2012 | 40       | 3001 |
      | bin1755 | 150      | 645a |
     When the quantity 25 of Part 655c is requested to be removed
     Then the following updated pick list is returned
      | Bin     | Quantity | Part |
      | bin2012 | 40       | 3001 |
      | bin1755 | 150      | 645a | 
  
  Scenario: Modify Pick List for Several Valid Products Including Duplicates (Alternate Flow)
  
    Given user OP3 is logged on as the operator
      And the inventory has been initialized
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 25       | 655c |
      | bin2012 | 40       | 3001 |
      | bin1755 | 150      | 645a |
     When modifications for the following products are requested
      | Quantity | Part | Update Operation | 
      | 25       | 655c | Add              |
      | 105      | 655c | Add              |
     Then the following updated pick list is returned
      | Bin     | Quantity | Part | 
      | bin1899 | 155      | 655c | 
      | bin2012 | 40       | 3001 | 
      | bin1755 | 150      | 645a | 
  
  Scenario: Modify Pick List for Several Valid Products from Multiple Bins (Alternate Flow)
  
    Given user OP3 is logged on as the operator
      And the inventory count is defined to be
      | Bin     | Quantity | Part | 
      | bin1899 | 300      | 655c | 
      | bin2012 | 20       | 3001 | 
      | bin2013 | 40       | 3001 | 
      | bin1755 | 350      | 645a | 
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 25       | 655c |
      | bin2012 | 10       | 3001 |
      | bin1755 | 150      | 645a |
     When modifications for the following products are requested
      | Quantity | Part | Update Operation | 
      | 25       | 655c | Add              |
      | 40       | 3001 | Add              |
      | 150      | 645a | Remove           |
     Then the following updated pick list is returned
      | Bin     | Quantity | Part | 
      | bin1899 | 50       | 655c | 
      | bin2012 | 20       | 3001 | 
      | bin2013 | 30       | 3001 |
  
  Scenario: Modify Pick List for Several Valid Products including 1 Invalid Product (Error Flow)
  
    Given user OP3 is logged on as the operator
      And the inventory has been initialized
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 25       | 655c |
      | bin2012 | 40       | 3001 |
     When modifications for the following products are requested
      | Quantity | Part       | Update Operation |  
      | 25       | 655c       | Add              | 
      | 20       | 3001       | Remove           |
      | 150      | blue brick | Add              | 
     Then the following updated pick list is returned
      | Bin      | Quantity | Part       | 
      | bin1899  | 50       | 655c       | 
      | bin2012  | 20       | 3001       | 
      | Part DNE | 150      | blue brick | 
  
  Scenario: Modify Pick List for Several Valid Products including 2 Invalid Products (Error Flow)
  
    Given user OP3 is logged on as the operator
      And the inventory has been initialized
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 25       | 655c |
      | bin2012 | 40       | 3001 |
     When modifications for the following products are requested
      | Quantity | Part       | Update Operation | 
      | 25       | 655c       | Add              |  
      | 40       | big wheel  | Add              | 
      | 150      | blue brick | Add              | 
     Then the following updated pick list is returned
      | Bin      | Quantity | Part       | 
      | bin1899  | 50       | 655c       |
      | bin2012  | 40       | 3001       |
      | Part DNE | 40       | big wheel  | 
      | Part DNE | 150      | blue brick | 
  
  Scenario: Modify Pick List for Several Valid Products including all Invalid Products (Error Flow)
  
    Given user OP3 is logged on as the operator
      And the inventory has been initialized
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 25       | 655c |
      | bin2012 | 40       | 3001 |
     When modifications for the following products are requested
      | Quantity | Part       | Update Operation |
      | 25       | shiny pin  | Add              |
      | 40       | big wheel  | Add              | 
      | 150      | blue brick | Add              | 
     Then the following updated pick list is returned
      | Bin      | Quantity | Part       |
      | bin1899  | 25       | 655c       |
      | bin2012  | 40       | 3001       |
      | Part DNE | 25       | shiny pin  | 
      | Part DNE | 40       | big wheel  | 
      | Part DNE | 150      | blue brick | 
  
  Scenario: Invalid Operator Attempts to Modify Pick List for One Valid Product (Error Flow)
  
    Given user Undefined is logged on as the operator
      And the inventory has been initialized
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 25       | 655c |
      | bin2012 | 40       | 3001 |
     When the quantity 25 of Part 655c is requested to be added
     Then the system displays an error message notifying that a valid Operator must be logged in
  
  Scenario: Suspended Operator Attempts to Modify Pick List for One Valid Product (Error Flow)
  
    Given user Suspended is logged on as the operator
      And the inventory has been initialized
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 25       | 655c |
      | bin2012 | 40       | 3001 |
     When the quantity 25 of Part 655c is requested to be added
     Then the system displays an error message notifying that an Operator who isn't suspended must be logged in
  
  Scenario: Modify Pick List for One Valid Product with Inventory not Initialized (Error Flow)
  
    Given user Undefined is logged on as the operator
      And the inventory has not been initialized
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 25       | 655c |
      | bin2012 | 40       | 3001 |
     When the quantity 25 of Part 655c is requested to be added
     Then the system displays an error message notifying that must be initialized before pick list can be modified
  
  Scenario: Modify Pick List for Several Valid Products with Insufficient Quantity from a Single Bin for a Single Product (Error Flow)
  
    Given user OP3 is logged on as the operator
      And the inventory count is defined to be
      | Bin     | Quantity | Part | 
      | bin1899 | 300      | 655c | 
      | bin2012 | 70       | 3001 | 
      | bin1755 | 350      | 645a | 
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 25       | 655c |
      | bin2012 | 40       | 3001 |
     When modifications for the following products are requested
      | Quantity | Part | Update Operation | 
      | 25       | 655c | Add              | 
      | 40       | 3001 | Add              |  
     Then the following updated pick list is returned
      | Bin       | Quantity | Part | 
      | bin1899   | 50       | 655c | 
      | bin2012   | 70       | 3001 | 
      | SHORTFALL | 10       | 3001 |
  
  Scenario: Modify Pick List for One Valid Product with Insufficient Quantity from Multiple Bins (Error Flow)
  
    Given user OP3 is logged on as the operator
      And the inventory count is defined to be
      | Bin     | Quantity | Part | 
      | bin1899 | 100      | 655c | 
      | bin1898 | 120      | 655c |
      | bin2012 | 400      | 3001 |
      And the existing pick list contains the following products and quantities
      | Bin     | Quantity | Part |
      | bin1899 | 30       | 655c |
      | bin2012 | 40       | 3001 |
     When the quantity 250 of Part 655c is requested to be added
     Then the following pick list is returned
      | Bin       | Quantity | Part | 
      | bin1899   | 100      | 655c | 
      | bin1898   | 120      | 655c | 
      | SHORTFALL | 60       | 655c |
      | bin2012   | 40       | 3001 |
