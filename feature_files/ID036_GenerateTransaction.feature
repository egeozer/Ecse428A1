Feature: Generate transaction summary report

  As an Auditor of the Lego(R) Part Warehouse System
  I would like to Generate a transaction summary report
  So that others can see the change of activity for the transactions

Scenario: Generate transaction summary report (Normal Flow)

  Given I am logged on as an Auditor
  And there has been changes atleast one transaction
  When I wish to see the transaction summary report
  Then I can see the history of the transactions
    |Customer_ID  |TransactionDate   |AmountPaid|MethodOfPay|
    |001           |01/01/1998       |45        |Credit     |
    |002           |01/01/1998       |333       |Debit      |
    |003           |02/05/1998       |44        |Cash       |

Scenario: Generate transaction summary report (Alternate Flow)
  Given I am logged on as an Auditor
  And there has been no transaction
  When I wish to see the transaction summary report
  Then I should see an empty list