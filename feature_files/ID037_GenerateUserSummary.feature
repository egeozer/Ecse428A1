Feature: Generate User Summary report

  As an Auditor of the Lego(R) Part Warehouse System
  I would like to Generate the User Summary report
  So that others can access the list of users registered in the system

Scenario: Generate a list of user summary (Normal Flow)

  Given I am logged on as an Auditor and there has been registered users in the system
  When I enter wish to generate the list of users registered into the system
  Then the system should generate a list of users with their information
    |UserID|UserType|RegisteredDate| Name   | Surname | email             | Phone Number | Address              | City     | Province | Country  |
    |001   |Customer|01/01/1998    | Pierre | Robert  | pierre@outlook.ca | 5143334444   | 3092 St-Laurent blvd | Montreal | QC       | Canada   |

Scenario: Generate a list of user summary (Alternate Flow)

  Given I am logged on as an Auditor and there has been no registered users in the system
  When I enter wish to generate the list of users registered into the system
  Then the system should not generate a list and give a blank list