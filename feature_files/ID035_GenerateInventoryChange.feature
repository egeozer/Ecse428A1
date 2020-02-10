  Feature: Generate inventory change report
  
  As an Auditor of the Lego(R) Part Warehouse System
  I would like to Generate change report for the inventories
  So that others can see the change of activity for the inventories
  
  Scenario: Generate list of inventory change (Normal Flow)
  
    Given I am logged on as an Auditor
      And there has been changes in the inventories
     When I wish to see changes of the inventories
     Then I can see the history of the inventories
      | Inventory_ID | LastTimeUpdated | ElementChanged | BeforeChange | AfterChange | 
      | 001          | 01/01/1998      | price          | 29           | 35          | 
      | 001          | 01/01/1998      | name           | name1        | name2       | 
      | 001          | 02/05/1998      | price          | 54           | 44          | 
  
  Scenario: Generate list of inventory change (Alternative Flow)
    Given I am logged on as an Auditor
      And there has been no changes in the inventories
     When I wish to see changes of the inventories
     Then I will see an emtpy list
  