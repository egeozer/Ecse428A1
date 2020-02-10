Feature: Notify the status of delivered items

  As a Warehouse picker of the Lego(R) Part Warehouse System
  I would like to Notify that the items are delivered to the destination
  So the list of inventory can get eventually updated by the inventory manager

Scenario: Notify that the items are delivered to the destination (Normal Flow)
  Given I am logged on as a Warehouse picker
  And there are parts that has been delivered to a warehouse
  When I wish to notify that the items has been successfully delivered
  Then the inventory manager will get notified to update the list of inventory

Scenario: Notify that the items are not delivered to the destination (Alternative Flow)
  Given I am logged on as a Warehouse picker
  And there are parts that have not been delivered to a warehouse
  When I wish to notify that the items has not been successfully delivered
  Then the inventory manager will get notified with a reason

