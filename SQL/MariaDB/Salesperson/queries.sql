
-- The names of all salespeople that have an order with Samsonic

SELECT s.Name FROM Salesperson s WHERE s.Salesperson_ID IN (
  SELECT o.Salesperson_id FROM Orders o, Customer c  
    WHERE
      (o.Cust_id = c.Customer_ID AND c.Name = 'Samsonic'));

-- The names of all salespeople that do not have any order with Samsonic

SELECT s.Name FROM Salesperson s WHERE s.Salesperson_ID IN (
  SELECT o.Salesperson_id FROM Orders o, Customer c
    WHERE
      (c.Customer_ID = o.Cust_id AND c.Name <> 'Samsonic'));

-- The names of salespeople that have 2 or more orders

SELECT s.Name FROM Salesperson s WHERE s.Salesperson_ID IN (
  select Salesperson_id from Orders group by 
    Salesperson_id having count(Salesperson_id) > 1);

SELECT s.Name FROM Orders o, Salesperson s 
    WHERE o.Salesperson_id = s.Salesperson_ID
    GROUP BY s.Name, o.Salesperson_id
    HAVING COUNT(o.Salesperson_id) > 1
        




