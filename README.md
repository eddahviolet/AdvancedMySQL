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

## Mission 2: Working with triggers

Lucky Shrub needs to impose business rules for inserting, updating and deleting product data in their database. Implement triggers on the Products table.

The Products table contains the following information about each product:
*	ProductID
*	ProductName  
*	BuyPrice
*	SellPrice
*	NumberOfItems

The main objective of this activity is to develop INSERT, UPDATE and DELETE triggers.

##### Task 1:

Create an INSERT trigger called ProductSellPriceInsertCheck. This trigger must check if the SellPrice of the product is less than the BuyPrice after a new product is inserted in the Products table. If this occurs, then a notification must be added to the Notifications table to inform the sales department. The sales department can then ensure that the incorrect values were not inserted by mistake.

**The notification message should be in the following format: A SellPrice less than the BuyPrice was inserted for ProductID + ProductID**

![M2 1a](https://user-images.githubusercontent.com/106580846/216033369-c692bc57-b2f8-4c4c-85cd-3282bed002e2.png)

**Insert a product  ProductID P7 with the SellPrice being less than BuyPrice.**

![M2 1b](https://user-images.githubusercontent.com/106580846/216033422-ef6ee92b-4215-434c-9df6-5a27fcaac30f.png)

**The alert sent to the Notifications table**

![M2 1c](https://user-images.githubusercontent.com/106580846/216033454-bdcd9123-341c-4c9f-9b52-2f9390173db0.png)

#### Task 2:
Create an UPDATE trigger called ProductSellPriceUpdateCheck. This trigger must check that products are not updated with a SellPrice that is less than or equal to the BuyPrice. If this occurs, add a notification to the Notifications table for the sales department so they can ensure that product prices were not updated with the incorrect values. 

**The notification message should be in the following format: ProductID + was updated with a SellPrice of  + SellPrice + which is the same or less than the BuyPrice**

![M2 2a](https://user-images.githubusercontent.com/106580846/216034067-dcb5afbe-9ad6-4635-975e-2f9245e526bb.png)

**Updating  ProductID P6 with a SellPrice that is less than BuyPrice**

![M2 2b](https://user-images.githubusercontent.com/106580846/216034118-1fb07a25-095a-44ae-896d-0e965d9040c6.png)

**The alert sent to the Notifications table**

![M2 2c](https://user-images.githubusercontent.com/106580846/216034148-e57f77d0-ae0b-420c-9bb3-968d4c3ed242.png)

#### Task 3:
Create a DELETE trigger called NotifyProductDelete. This trigger must insert a notification in the Notifications table for the sales department after a product has been deleted from the Products table.

**The notification message should be in the following format: The product with a ProductID  + ProductID + was deleted**

![M2 3a](https://user-images.githubusercontent.com/106580846/216034560-b5e3c0f9-0279-433c-9a2f-8f21f9c3783d.png)

**Deleting  ProductID P7 from the Products table**
![M2 3b](https://user-images.githubusercontent.com/106580846/216034629-99d62e02-8394-401b-b4a1-884e422ed5f4.png)

**The alert sent to the Notifications table**

![M2 3c](https://user-images.githubusercontent.com/106580846/216034696-c4f47b56-12d4-42f9-8d10-f08b13d1e456.png)

## Mission 4: SELECT statement optimization in MySQL
Lucky Shrub need to execute a series of SELECT queries against their database to retrieve information on their employees and client orders. However, they need to optimize these queries first to make sure that they execute quickly and efficiently using MySQL database optimization techniques.

#### Task 1
Lucky Shrub needs data on client orders. They have written the following SELECT query to retrieve all data from the Orders table:

**SELECT * FROM Orders;**
