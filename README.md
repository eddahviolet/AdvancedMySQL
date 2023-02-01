# AdvancedMySQLTopics

## Mission 1: Developing functions & stored procedures in MySQL

Lucky Shrub needs to query their database. They can do this by using functions and stored procedures in MySQL.

#### Task 1:
Create a SQL function that prints the cost value of a specific order based on the user input of the OrderID. 

Call the function with an OrderID of 5.
![M1 1](https://user-images.githubusercontent.com/106580846/216032538-abdad9e8-84a9-499e-a4d4-709546eadb80.png)

#### Task 2:
Create a stored procedure called GetDiscount. This stored procedure must return the final cost of the customer's order after the discount value has been deducted. 
The discount value is based on the order's quantity. The stored procedure must have the following specifications: 
*	The procedure should take one parameter that accepts a user input value of an OrderID. 
*	The procedure must find the order quantity of the specific OrderID. 
*	If the value of the order quantity is more than or equal to 20 then the procedure should return the new cost after a 20% discount. 
*	If the value of the order quantity is less than 20 and more than or equal to 10 then the procedure should return the new cost after a 10% discount.

Call the procedure with OrderID 5.

![M1 2a](https://user-images.githubusercontent.com/106580846/216032765-4473a37d-d4e5-4a4b-b54f-2314ab7d068a.png)
![M1 2b](https://user-images.githubusercontent.com/106580846/216032803-d79d4ee9-c563-4ed8-8e18-4b7716b789f1.png)


