Feature: Complete picking

  As a Warehouse picker of the Lego(R) Part Warehouse System
  I would like to complete picking process
  So the system has the picking status set as complete

Scenario: Warehouse picker completes picking (Normal Flow)
  Given I am logged on as a Warehouse picker
  And there are parts that has been delivered to a warehouse and notified
  When I wish to complete the picking
  Then the system updates the picking task as complete with a success

Scenario: Warehouse picker completes picking (Alternate Flow)
  Given I am logged on as a Warehouse picker
  And there are parts that has not been delivered to a warehouse and notified
  When I wish to complete the picking
  Then the system updates the picking task as complete but with a warning

Scenario: Warehouse picker completes picking (Error Flow)
  Given I am logged on as a Warehouse picker
  And there are parts that has been delivered to a warehouse but not notified
  When I wish to complete the picking
  Then the system gives an error message since nothing was notified

Scenario: Warehouse picker completes picking (Error Flow)
  Given I am logged on as a Warehouse picker
  And there are parts that has not been delivered to a warehouse and not notified
  When I wish to complete the picking
  Then the system gives an error message since nothing was notified



