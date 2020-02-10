Feature: Generate Part Consumption chart

  As an Auditor of the Lego(R) Part Warehouse System
  I would like to Generate a Part Consumption Chart
  So that others can see the part consumption in the system

Scenario: Generate a list of part consumption in the system (Normal Flow)

  Given I am logged on as an Auditor and there are multiple parts registered in the system
  When I wish to generate the Part Consumption Chart
  Then the system should generate a Part Consumption Chart

Scenario: Scenario: Generate a list of part consumption in the system (Error Flow)

  Given I am logged on as an Auditor and there are no parts registered in the system
  When I wish to generate the Part Consumption Chart
  Then the system should give an error as there are no registered parts in the system