Feature: Query Items to be Picked

  As a Warehouse picker of the Lego(R) Part Warehouse System
  I would like to Query the list of items to be picked up
  So that I can get the list of items to be picked up

  Scenario: Query Items to be Picked (Normal Flow)

  Given I am logged on as a Warehouse picker
  And there are parts that are ready to be picked up
  When I wish to query items to be picked up
  Then the system should generate a list of items to be picked up
    |Quantity   |Part  |Name   |Location    |
    |25         |655c  |name1  |warehouseA  |
    |40         |3001  |name2  |warehouseB  |
    |150        |645a  |name3  |warehouseC  |
  Scenario: Query Items to be Picked (Alternative Flow)

  Given I am logged on as a Warehouse picker
  And there are no parts that are ready to be picked up
  When I wish to query items to be picked up
  Then the system should not generate a list of items to be picked up



