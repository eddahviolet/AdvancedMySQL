use Lucky_Shrub;

-- MISSION 1: WORKING WITH FUNCTIONS & COMPLEX STORED PROCEDURES
-- TASK 1
/*Create a SQL function that prints the cost value of a specific order based on the user input of the OrderID. */

create function FindCost(order_id int) returns decimal (5,2) deterministic 
return (select Cost from Orders where OrderID = order_id);

select FindCost(5);

-- TASK 2
/*Create a stored procedure called GetDiscount. This stored procedure must return the final cost of the customer's 
order after the discount value has been deducted.  */

DELIMITER // 
create procedure GetDiscount(OrderIDInput int) 
begin
     declare cost_after_discount decimal (7,2); 
     declare current_cost decimal(7,2); 
     declare order_quantity int; 
     select Quantity into order_quantity from Orders where OrderID = OrderIDInput; 
     select Cost into current_cost from Orders where OrderID = OrderIDInput; 
      if order_quantity >= 20 then
        set cost_after_discount = current_cost - (current_cost * 0.2);  
       elseif (order_quantity >= 10) then
         set cost_after_discount = current_cost - (current_cost * 0.1); 
       else set cost_after_discount = current_cost;
        end if;
    select cost_after_discount; 
end//
delimiter ;

call GetDiscount(5);

  
