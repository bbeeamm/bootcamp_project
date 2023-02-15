.mode column
.header on

CREATE TABLE product (
  product_id int,
  product_name text,
  price int,
  PRIMARY key (product_id)); 
 
INSERT into product VALUEs
	(1,'Spaghetti',200),
    (2,'Salad',150),
    (3,'Pizza',350),
    (4,'Chicken soup',100),
    (5,'french fries',80); 
    
CREATE TABLE branch (
  branch_id int,
  branch_name text,
  PRIMARY key (branch_id)); 

INSERT into branch VALUES
	(1,'siam'),
    (2,'silom'),
    (3,'bangkapi');
    
CREATE TABLE cashier (
  cashier_id int,
  cashier_name text,
  PRIMARY key (cashier_id)); 
 
INSERT into cashier VALUES
	(1,'Mary'),
    (2,'Anna'),
    (3,'Jame');
    
CREATE TABLE customer (
  customer_id int,
  firstname text,
  lastname text,
  PRIMARY key (customer_id));
  
INSERT into customer VALUES
	(1,'Mercy','Loco'),
    (2,'Mark','Soo'),
    (3,'jenie','Kim'),
    (4,'lalisa','backpink'),
    (5,'Ikyou','Kmu');
    
CREATE table orders (
  orders_id int,
  orders_date date,
  product_id int,
  branch_id int,
  customer_id int,
  quantity int,
  cashier_id int,
  PRIMARY key (orders_id),
  FOREIGN key (product_id) REFERENCES product(product_id),
  FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN key (cashier_id) REFERENCES cashier(cashier_id)); 
  
INSERT INTO orders VALUES
	  (1,'2022-09-05',1,2,1,2,2),
    (2,'2022-09-05',1,3,2,1,3),
    (3,'2022-10-07',3,1,2,3,1),
    (4,'2022-10-09',4,2,5,4,2),
    (5,'2022-11-20',2,1,1,5,1),
    (6,'2022-11-23',4,2,4,2,2),
    (7,'2022-12-02',5,3,3,1,3),
    (8,'2022-12-12',5,2,4,2,2),
    (9,'2022-12-14',5,2,4,3,2),
    (10,'2022-12-14',5,3,1,1,3);

--select * from orders;
-----------------------------------------------------
--with

WITH sub AS (
   SELECT
  	customer.customer_id,
  	orders.customer_id AS oc,
    customer.firstname || ' ' || customer.lastname AS 
    customer_name,
    product.price * orders.quantity As sales
  from orders
  join customer ON customer.customer_id = orders.customer_id
  join product ON product.product_id = orders.product_id
 )
  
--  Customers who place the most orders
SELECT 
    customer_name,
    count(oc) AS n_times, 
    avg(sales) As AverageBuy
FROM sub
 GROUP BY customer_name
 ORDER BY n_times  DESC;

-------------------------------------------------------------

-- Top Menu 
select 
  ProductName,
  Sum(sales) As Total
from (
  select
    product.price * orders.quantity As sales,
    product.product_name As ProductName
  from orders
 join product ON orders.product_id = product.product_id
  ) as sub1
group by ProductName
order by sales DESC;

----------------------------------------------------------------
-- total income and mean income monthly 
select 
  month ,
  sum(sales) As Total,
  avg(sales) As average_total
  from (
  select
    STRFTIME ('%m',orders.orders_date) As month,
    product.price * orders.quantity As sales
  from orders 
  join product ON orders.product_id = product.product_id
  ) as sub2
group by month
order by sales DESC;

---------------------------------------------------------------
--Most used branches

select 
  Namebranch,
  NameCashier,
  count(bid)As branch_count,
  avg(sales) As average_total
  from (
  select 
    branch.branch_id As bid,
    branch.branch_name As NameBranch,
    cashier.cashier_name As NameCashier,
    product.price * orders.quantity As sales
  from orders 
  join cashier ON cashier.cashier_id = orders.cashier_id
  join branch ON branch.branch_id = orders.branch_id
  join product ON product.product_id = orders.product_id
  ) as sub1
group by Namebranch
order by branch_count DESC;
