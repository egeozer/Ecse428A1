Feature: Generate User Change report

  As an Auditor of the Lego(R) Part Warehouse System
  I would like to Generate the User Change report
  So that others can see the changes for the user in the system

Scenario: Generate a list of user change (Normal Flow)

  Given I am logged on as an Auditor and there has been changes to atleast one user in the system
  When I wish to generate the list of users that changed information
  Then the system should generate a list of users who changed their information
    |UserID|UserType|ChangedAttribute|BeforeChange          |AfterChange              |
    |001   |Customer|PhoneNumber     |+15148653363          |+15141231234             |
    |001   |Customer|email           |daxter000@hotmail.com |ege.ozer@mail.mcgill.ca  |

Scenario: Generate a list of user summary (Alternate Flow)

  Given I am logged on as an Auditor and there has been no changes of users in the system
  When I wish to generate the list of users that changed information
  Then the system should generate a list of users who changed their information