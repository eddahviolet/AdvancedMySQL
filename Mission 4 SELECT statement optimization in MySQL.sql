use Lucky_Shrub;

-- Task 1
/*Targeting only required columns to optimize a select statement*/

select OrderID, ProductID, Quantity, Date from Orders;

-- Task 2
/*creating an index to optimize a select statement*/
-- checking columns before creating index
explain select * from Orders where ClientID ='Cl1';

create index IdxClientID on Orders(ClientID);

-- checking column after creating index
explain select * from  Orders where ClientID='Cl1';

-- Task 3
/*using a select statement with a leading wildcard on a indexed column*/

-- viewing Employee table before altering
select * from Employees;

-- adding column to Employee table
alter table Employees add column ReverseFullName varchar (200);

-- populating ReverseFullName
update Employees set ReverseFullName = concat(substring_index(FullName, ' ',-1), substring_index(FullName,' ', 1));

-- create index on the ReversefullName column
create index IdxReverseFullName on Employees (ReverseFullName);

-- use a leading wildcard instead of the leading wildcard on the indexed column
select * from Employees where ReverseFullName like 'Tolo%'








