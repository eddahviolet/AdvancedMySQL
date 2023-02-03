use Lucky_Shrub;

-- Task 1
/*Create a one-off event named GenerateRevenueReport to run 12 hours from now*/

delimiter //
create event if not exists GenerateRevenueReport on schedule at current_timestamp + interval 12 hour do
begin
insert into ReportData (OrderID, ClientID, ProductID, Quantity, Cost, Date)
select * from Orders where Date between "2020-08-01" and "2022-08-31" ; 
end//
delimiter ;
 
show events; 
 
 -- Task 2
 /*Create a recurring event named DailyRestock to achieve this to check stock revels every day*/

delimiter //
create event DailyRestock on schedule every 1 day do
begin
if Products.NumberOfItems < 50 then update Products set NumberOfItems = 50;
end if;
end//
delimiter ;

show events;






