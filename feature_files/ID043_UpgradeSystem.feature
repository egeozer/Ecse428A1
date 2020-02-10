Feature: Upgrade the system

  As a System Administrator of the Lego(R) Part Warehouse System
  I would like Upgrade the system
  So that the system can adapt to the different amount of attributes

Scenario: I would like Upgrade the system (Normal Flow)
  Given I am logged on as a System Administrator
  And the data migration has already been done to change to the new attributes tables
  When I wish to upgrade the system
  Then the system upgrades to the new system for everyone

Scenario: I would like Upgrade the system (Alternate Flow)
  Given I am logged on as a System Administrator
  And the data migration has already been done to change to the new attributes tables
  When I wish to upgrade the system
  Then the system upgrades to the new system for a specific user

Scenario: I would like Upgrade the system (Normal Flow)
  Given I am logged on as a System Administrator
  And the data migration has not been done to change to the new attributes tables
  When I wish to upgrade the system
  Then the system gives an error message stating that the upgrade cannot be done since the migration did not take place

