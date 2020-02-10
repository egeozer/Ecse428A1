Feature: Generate inventory report

  As an Auditor of the Lego(R) Part Warehouse System
  I would like to Generate the inventory report
  So that others can access the list of inventories

Scenario: Generate a list of inventories (Normal Flow)

  Given I am logged on as an Auditor
  When I enter the incoming stock information to the system and submit into the system
    |Quantity   |Part      |Unit Price|Name   |
    |25         |655c      |25        |name1  |
    |40         |3001      |40        |name2  |
    |150        |645a      |150       |name3  |
  Then the system should create a detailed list of inventories
    |Inventory_ID  |Name  |In Stock   |Part      |Unit Price|
    |001           |name1 |25         |655c      |120       |
    |002           |name2 |40         |3001      |289       |
    |003           |name3 |150        |645a      |322       |

Scenario: Generate a list of inventories with existing items with the same description (Alternative Flow)

  Given I am logged on as an Auditor
  And I already have the items in the database that I wish to add
  When I enter the incoming stock information to the system and submit into the system
    |Quantity   |Part      |Unit Price|Name   |
    |25         |655c      |25        |name1  |
    |40         |3001      |40        |name2  |
    |150        |645a      |150       |name3  |
  Then the system should create a detailed list of inventories with the updated stock numbers
    |Inventory_ID  |Name  |In Stock   |Part      |Unit Price|
    |001           |name1 |433        |655c      |120       |
    |002           |name2 |532        |3001      |289       |
    |003           |name3 |234        |645a      |322       |

Scenario: Generate a list of inventories with existing items with the same description (Alternative Flow)

  Given I am logged on as an Auditor
  And I already have the items in the database that I wish to add with different names
  When I enter the incoming stock information to the system and submit into the system
    |Quantity   |Part      |Unit Price|Name   |
    |25         |655c      |25        |name10  |
    |40         |3001      |40        |name20  |
    |150        |645a      |150       |name30  |
  Then the system should create a detailed list of inventories with the old and new names
    |Inventory_ID  |Name   |In Stock   |Part      |Unit Price|
    |001           |name1  |433        |655c      |120       |
    |002           |name2  |532        |3001      |289       |
    |003           |name3  |234        |645a      |322       |
    |004           |name10 |25         |655c      |120       |
    |005           |name20 |40         |3001      |289       |
    |006           |name30 |150        |645a      |322       |
Scenario: Generate a list of inventories with an empty or an invalid part name (Error Flow)

  Given I am logged on as an Auditor
  When I enter the incoming stock information to the system with invalid or empty part number and submit
    |Quantity   |Part      |Unit Price|Name    |
    |25         |          |25        |name10  |
    |40         |          |40        |name20  |
    |150        |          |150       |name30  |
  Then the system should not create any list and give an error to input a valid part name
