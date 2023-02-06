use Lucky_Shrub;
-- Data analysis in MySQL
-- Task 1
/*Create a query that returns the total quantity of all products with the ID of P4 sold in the years 
2020, 2021 and 2022. */

select CONCAT (sum(Quantity), "(2020)") as "P4 product: Quantity sold" from Orders where year (Date) = 2020 
and ProductID = "P4"
union
select CONCAT (sum(Quantity), "(2021)") from Orders where year (Date) = 2021 and ProductID = "P4"
union
select CONCAT (sum(Quantity), "(2022)") from Orders where year (Date) = 2022 and ProductID = "P4";

-- Task 2
/*extracting data from multiple tables using joins*/

select Clients.ClientID, Clients.ContactNumber, Addresses.Street, Addresses.County,  Orders.OrderID, 
Orders.ProductID, Products.ProductName, Orders.Cost, Orders.Date 
from Clients inner join Addresses on Clients.AddressID = Addresses.AddressID 
inner join Orders on Clients.ClientID = Orders.ClientID 
inner join Products on Orders.ProductID = Products.ProductID 
where year (Orders.Date) = 2021 or year (Orders.Date) = 2022 order by Orders.Date;

-- Task 3
/*Create a function called FindSoldQuantity that when input a ProductID and a year will outputthe total quantity 
of the product sold in the given year.*/

create function FindSoldQuantity (product_id varchar(10), YearInput int) returns int deterministic 
return (select sum(Quantity) from Orders where ProductID = product_id and year (Date) = YearInput);

select FindSoldQuantity ("P3", 2021);





