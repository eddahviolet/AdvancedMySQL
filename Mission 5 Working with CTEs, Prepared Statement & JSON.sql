use Lucky_Shrub;

-- Task 1
/*Working with common table expressions*/

with
orders1 as (select CONCAT("Cl1: ", COUNT(OrderID), " orders") as "Total number of orders" 
from Orders where year(Date) = 2022 and ClientID = "Cl1"), 
orders2 as (select  CONCAT("Cl2: ", COUNT(OrderID), " orders") from Orders where year(Date) = 2022 and ClientID = "Cl2"), 
orders3 AS (select  CONCAT("Cl3: ", COUNT(OrderID), " orders") from Orders where year(Date) = 2022 and ClientID = "Cl3") 
select * from orders1
union 
select * from orders2
union 
select * from orders3;

-- Task 2
/*Working with prepared statements*/

prepare GetOrderDetail from 'select OrderID, Quantity, Cost, Date from Orders where ClientID = ? and year(Date) = ? ';

set @ID = 'Cl1';
set @year = 2020;

Execute GetOrderDetail using @ID, @year;

-- Task 3
/*Working with json*/

select * from activity;

select Activity.Properties ->>'$.ProductID' as ProductID, Products.ProductName, Products.BuyPrice, Products.SellPrice 
from Products inner join Activity on Products.ProductID = Activity.Properties ->>'$.ProductID' 
where Activity.Properties ->>'$.Order' = "True";


