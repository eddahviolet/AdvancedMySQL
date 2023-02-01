use Lucky_Shrub;
-- MISSION 2: WORKING WITH TIGGERS
-- TASK 1
/*Create an INSERT trigger called ProductSellPriceInsertCheck. This trigger must check if the SellPrice of
 the product is less than the BuyPrice after a new product is inserted in the Products table. */
 
delimiter //
create trigger ProductSellPriceInsertCheck after insert on Products for each row  
begin
 if new.SellPrice <= new.BuyPrice then insert into Notifications(Notification, DateTime) 
	values (CONCAT('A SellPrice same or less than the BuyPrice was inserted for ProductID ', new.ProductID), NOW()); 
 end if;
end;//
delimiter //

insert into Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfITems) VALUES   
("P7", "Monstera", 100, 50, 100);  
 
select * from Notifications;
 
 -- TASK 2
/*Create an UPDATE trigger called ProductSellPriceUpdateCheck. This trigger must check that products are 
not updated with a SellPrice that is less than or equal to the BuyPrice*/
 
delimiter//
create trigger ProductSellPriceUpdateCheck after update on Products for each row  
begin
if new.SellPrice <= new.BuyPrice then insert into Notifications(Notification, DateTime) 
	values (CONCAT(new.ProductID,' was updated with a SellPrice of ', new.SellPrice,' which is the same 
    or less than the BuyPrice'), NOW()); 
end if;
end;
delimiter;

update Products  set SellPrice = 40 where ProductID = "P6"; 

select * from Notifications;

-- TASK 3
/*Create a DELETE trigger called NotifyProductDelete that must insert a notification in the 
Notifications table for the sales department after a product has been deleted from the Products table.*/

delimiter//
create trigger NotifyProductDelete after delete on Products for each row   
	insert into Notifications(Notification, DateTime) 
    values (CONCAT('The product with a ProductID ', old.ProductID,' was deleted'), NOW()); 
delimiter;

delete from Products where ProductID = "P7";

select * from Notifications;



